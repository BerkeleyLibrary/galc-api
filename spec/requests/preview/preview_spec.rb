require 'rails_helper'

RSpec.describe Preview::PreviewController, type: :request do
  describe 'GET /preview' do
    context 'with the preview environment enabled' do
      before do
        allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return(true)
      end

      it 'shows a test UI in when SERVE_TEST_UI is true' do
        get preview_path
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to start_with('text/html')
      end

      context 'sets the API URL correctly' do
        it 'sets the url for staging API in production' do
          allow(Rails.env).to receive(:production?).and_return(true)
          get preview_path
          expect(assigns(:api_url)).to eq('https://galc-api.ucblib.org')
        end

        it 'sets the url for API to be localhost in dev/test' do
          allow(Rails.env).to receive(:production?).and_return(false)
          get preview_path
          expect(assigns(:api_url)).to eq('http://localhost:3000')
        end
      end
    end
  end
end
