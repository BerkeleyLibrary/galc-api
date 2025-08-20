require 'rails_helper'
require 'support/cas_contexts'

RSpec.describe AuthController, type: :request do

  # ------------------------------------------------------------
  # Fixture

  # This is buried too deep in OmniAuth to mock easily, so we just use
  # the real one (and provide this let() block as a convenience
  let(:cas_host) { Rails.application.config.cas_host }

  let(:origin_url) { 'https://galc.example.test/galc?reserve=1' }
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
    allow(Rails.application.config).to receive(:hosts).and_return([cas_host, origin_uri.host])
    stub_request(:get, %r{https://#{cas_host}/cas/p3/serviceValidate}).to_return(status: 200, body: File.read('spec/data/cas/5551215.xml'))
  end

  # ------------------------------------------------------------
  # Tests

  describe 'GET /' do
    it 'returns 404 Not Found' do
      allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return(nil)
      get root_path
      expect(response).to have_http_status(:not_found)
    end

    it 'redirects to a test UI in staging' do
      allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return(true)

      get root_path
      expect(response).to redirect_to(preview_path)
    end
  end

  describe 'GET /auth/calnet' do
    # See https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
    it 'is disallowed' do
      expect { get login_path, params: { origin: origin_url } }.to raise_error(ActionController::RoutingError)

      # TODO: use this instead of expect { … }.to raise_error ?
      # expect(response).not_to be_successful
    end
  end

  # NOTE: In effect we're just testing omniauth-cas here, but with
  #       app-specific configuration and CalNet-specific data, to
  #       be completely sure we know what we're doing
  describe 'authentication flow' do

    def callback_url_from_cas_redirect(loc)
      CasContexts.callback_url_from_cas_redirect(loc, ticket)
    end

    describe 'login' do
      it 'routes to CAS' do
        post login_path, params: { origin: origin_url }

        # we specifically want 302 Found because we *want* the browser to redirect from POST to GET
        expect(response).to have_http_status(:found)

        # we use start_with omniauth-cas appends some extra noise; see https://github.com/dlindahl/omniauth-cas/pull/67
        expect(response.headers['Location']).to start_with(cas_login_url)
      end

      it 'initializes a user from the auth response and sets a JWT token in the redirect URL' do
        post login_path, params: { origin: origin_url }

        # NOTE: We can't use follow_redirect! b/c the Rack::Test mock client
        #       thinks all requests are local; so we just pretend we hit the
        #       CAS login URL and it redirected the browser back here.
        redirect_location = response.headers['Location']
        callback_url = callback_url_from_cas_redirect(redirect_location)
        get callback_url

        expected_attrs = {
          uid: '5551215',
          display_name: 'Rachel Roe',
          email: 'rroe-alt@berkeley.test',
          galc_admin: true
        }

        expected_token = User.new(**expected_attrs).to_jwt_payload
        redirect_url = JWTSupport.append_token(origin_url, expected_token)

        expect(response).to redirect_to(redirect_url)
      end

      it 'rejects an invalid origin' do
        bad_origin_url = origin_url.sub(origin_uri.host, "not-#{origin_uri.host}")
        post login_path, params: { origin: bad_origin_url }

        callback_url = callback_url_from_cas_redirect(response.headers['Location'])
        expect { get callback_url }.to raise_error(ActionController::Redirecting::UnsafeRedirectError)
      end
    end

    describe 'logout' do
      before do
        post login_path, params: { origin: origin_url }
        get callback_url_from_cas_redirect(response.headers['Location'])
      end

      it 'redirects to the CAS logout URL' do
        cas_base_uri = URI.parse("https://#{Rails.application.config.cas_host}")
        cas_logout_url = BerkeleyLibrary::Util::URIs.append(cas_base_uri, '/cas/logout').to_s

        get logout_path
        expect(response).to redirect_to(cas_logout_url)
      end
    end
  end
end
