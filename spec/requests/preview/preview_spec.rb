require 'rails_helper'

RSpec.describe Preview::PreviewController, type: :request do
  describe 'GET /' do
    context 'with the preview environment enabled' do
      before do
        allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return(true)
      end

      it 'shows a test UI in when SERVE_TEST_UI is true' do
        allow(ENV).to receive(:[]).with('GALC_API_URL').and_return('https://galc.biz')
        get preview_path
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to start_with('text/html')
      end

      context 'sets the API URL correctly' do
        it 'sets the url when GALC_API_URL is present' do
          allow(ENV).to receive(:[]).with('GALC_API_URL').and_return('https://galc.biz')
          get preview_path
          expect(assigns(:api_url)).to eq('https://galc.biz')
        end

        it 'sets the API URL when GALC_API_URL is not present' do
          allow(ENV).to receive(:[]).with('GALC_API_URL').and_return(nil)
          get preview_path
          expect(assigns(:api_url)).to eq('http://localhost:3000')
        end
      end
    end
  end
end
