require 'rails_helper'

RSpec.describe 'Facets', type: :request do
  before do
    # creating the terms creates the facets by side effect
    FactoryBot.factories.select { |f| f.build_class == Term }.each { |f| create(f.name) }
  end

  describe 'reading' do
    describe :index do
      it 'returns the facets' do
        get facets_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(Facet.all, { include: [:terms] })
      end
    end
  end
end
