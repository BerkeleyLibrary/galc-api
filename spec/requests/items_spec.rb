require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    # misusing an internal API, but what can you do?
    # https://github.com/thoughtbot/factory_bot/issues/1534
    FactoryBot.factories.each { |f| create(f.name) if f.build_class == Item }
  end

  describe 'GET /index' do
    it 'returns the items' do
      expect(Item).to exist # just to be sure

      get items_url

      expect(response).to be_successful
      expect(response.content_type).to start_with('application/json')

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an(Array)

      expect(parsed_response.size).to eq(Item.count)

      # TODO: check response content / format
    end
  end
end
