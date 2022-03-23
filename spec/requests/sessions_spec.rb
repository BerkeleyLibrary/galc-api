require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  # ------------------------------------------------------------
  # Fixture

  # This is buried too deep in OmniAuth to mock easily, so we just use
  # the real one (and provide this let() block as a convenience
  let(:cas_host) { Rails.application.config.cas_host }

  let(:origin_url) { 'https://galc.example.test/galc' }
  let(:origin_uri) { URI.parse(origin_url) }

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
    stub_request(:get, %r{https://#{cas_host}/cas/p3/serviceValidate}).to_return(status: 200, body: File.read('spec/data/cas/5551215.xml'))
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

    def callback_url_from_cas_redirect(cas_login_url)
      cas_login_uri_actual = URI.parse(cas_login_url)
      service_url_param = CGI.parse(cas_login_uri_actual.query)['service'].first
      URI.parse(service_url_param).tap do |uri|
        params = CGI.parse(uri.query).merge(ticket: ticket)
        uri.query = params.to_query
      end.to_s
    end

    describe 'login' do
      it 'routes to CAS' do
        post login_path, params: { origin: origin_url }

        # we specifically want 302 Found because we *want* the browser to redirect from POST to GET
        expect(response).to have_http_status(:found)

        # we use start_with omniauth-cas appends some extra noise; see https://github.com/dlindahl/omniauth-cas/pull/67
        expect(response.headers['Location']).to start_with(cas_login_url)
      end

      it 'initializes a user from the auth response and stores it in the session' do
        post login_path, params: { origin: origin_url }

        user = session[User::SESSION_KEY]
        expect(user).to be_nil # just to be sure

        # NOTE: We can't use follow_redirect! b/c the Rack::Test mock client
        #       thinks all requests are local; so we just pretend we hit the
        #       CAS login URL and it redirected the browser back here.
        get callback_url_from_cas_redirect(response.headers['Location'])

        user = session[User::SESSION_KEY]
        expect(user).to be_a(User)
        {
          uid: '5551215',
          display_name: 'Rachel Roe',
          email: 'rroe@berkeley.test',
          galc_admin: true
        }.each do |attr, v_expected|
          v_actual = user.send(attr)
          expect(v_actual).to eq(v_expected), "Wrong value for #{attr}; expected #{v_expected}, was #{v_actual}"
        end

        expect(response).to redirect_to(origin_url)
      end
    end
  end
end
