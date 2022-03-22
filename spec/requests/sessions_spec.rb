require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  # ------------------------------------------------------------
  # Fixture

  # This is buried too deep in OmniAuth to mock easily, so we just use
  # the real one (and provide this let() block as a convenience
  let(:cas_host) { Rails.application.config.cas_host }

  let(:origin_url) { 'https://galc.example.test/galc' }

  let(:ticket) { 'ST-99-SGVsbG8hIEknbSBhIHRpY2tldCE-auth-t02' }

  let(:service_callback_url) do
    omniauth_callback_url(provider: 'calnet')
  end

  let(:cas_login_url) do
    cas_url_base = "https://#{cas_host}/cas/login"
    cas_url_query = { service: service_callback_url }.to_query
    "#{cas_url_base}?#{cas_url_query}"
  end

  let(:validation_url) do
    validation_url_base = "https://#{cas_host}/cas/p3/serviceValidate"
    validation_url_params = { service: service_callback_url, ticket: ticket }.to_query
    "#{validation_url_base}?#{validation_url_params}"
  end

  before do
    stub_request(:get, %r{https://#{cas_host}/cas/p3/serviceValidate}).to_return(status: 200, body: File.read('spec/data/cas/rawxml.xml'))
  end

  # ------------------------------------------------------------
  # Tests

  describe 'GET /auth/calnet' do
    # See https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
    it 'is disallowed' do
      expect { get login_path, params: { origin: origin_url } }.to raise_error(ActionController::RoutingError)

      # TODO: use this instead of expect { … }.to raise_error ?
      # expect(response).not_to be_successful
    end
  end

  # NOTE: In effect we're just testing omniauth-can here, but with
  #       app-specific configuration and CalNet-specific data, to
  #       be completely sure we know what we're doing
  describe 'authentication flow' do
    describe 'login' do
      it 'routes to CAS' do
        post login_path, params: { origin: origin_url }

        # we specifically want 302 Found because we *want* the browser to redirect from POST to GET
        expect(response).to have_http_status(:found)

        # we use start_with omniauth-cas appends some extra noise; see https://github.com/dlindahl/omniauth-cas/pull/67
        expect(response.headers['Location']).to start_with(cas_login_url)
      end

      it 'sets/reads session variables around the callback' do
        post login_path, params: { origin: origin_url }

        # NOTE: We can't use follow_redirect! b/c the Rack::Test mock client
        #       thinks all requests are local, so we just pretend we hit the
        #       CAS login URL and it redirected the browser back here.
        cas_login_uri_actual = URI.parse(response.headers['Location'])
        service_url_param = CGI.parse(cas_login_uri_actual.query)['service'].first
        full_callback_url = URI.parse(service_url_param).tap do |uri|
          params = CGI.parse(uri.query).merge(ticket: ticket)
          uri.query = params.to_query
        end.to_s

        expected_message = {
          msg: 'Received omniauth callback',
          omniauth: hash_including(
            {
              # TODO: test auth/extra
              'credentials' => { 'ticket' => ticket },
              'provider' => :calnet,
              'uid' => '5551215'
            }
          )
        }
        expect(Rails.logger).to receive(:debug).with(expected_message)

        get full_callback_url
        # TODO: test that the callback URL does the thing
      end
    end
  end
end
