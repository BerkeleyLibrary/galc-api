require 'rails_helper'

RSpec.describe 'Facets', type: :request do
  before do
    # creating the terms creates the facets by side effect
    create_all(Term)
  end

  describe 'reading' do
    describe :index do
      it 'returns the facets' do
        get facets_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(Facet.all)
      end

      it 'accepts JSONAPI include parameters' do
        get facets_url, params: { include: 'terms' }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(Facet.all, { include: [:terms] })
      end

      it 'returns a Access-Control-Allow-Origin header in response to an Origin header' do
        origin = 'www.lib.berkeley.edu'
        get facets_url, params: { include: 'terms' }, headers: { 'Origin' => origin }

        expect(response).to be_successful
        expect(response.headers['Access-Control-Allow-Origin']).to eq(origin)
      end
    end
  end
end
