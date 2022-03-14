require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET /index' do
    it 'returns 403 Forbidden for HTML requests' do
      get items_url, as: :html
      expect(response.status).to eq(403)
      expect(response.content_type).to start_with('text/html')
    end

    it 'returns the items for JSON requests' do
      get items_url, as: :json

      expect(response).to be_successful
      expect(response.content_type).to start_with('application/json')

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an(Array)
    end
  end
end
