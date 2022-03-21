require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  # ------------------------------------------------------------
  # Fixture

  # This is buried too deep in OmniAuth to mock easily, so we just use
  # the real one (and provide this let() block as a convenience
  let(:cas_host) { Rails.application.config.cas_host }

  let(:origin_url) { 'https://galc.example.test/galc' }

  # ------------------------------------------------------------
  # Tests

  describe '/auth/calnet' do
    describe 'GET' do
      it 'is disallowed' do
        get login_path, params: { url: origin_url }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'POST /auth/calnet' do
    it 'routes to CAS' do
      post login_path, headers: { 'Referer' => origin_url }

      expect(response).to have_http_status(:found)

      callback_url_base = omniauth_callback_url(provider: 'calnet')
      callback_url_query = { url: origin_url }.to_query
      full_callback_url = "#{callback_url_base}?#{callback_url_query}"

      cas_url_base = "https://#{cas_host}/cas/login"
      cas_url_query = { service: full_callback_url }.to_query
      cas_login_url = cas_url_base + "?#{cas_url_query}"

      expect(response).to redirect_to(cas_login_url)
    end

    # TODO: figure out how much of the auth flow we want to test
  end
end
