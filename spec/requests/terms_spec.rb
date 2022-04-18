require 'rails_helper'

RSpec.describe 'Terms', type: :request do
  before do
    FactoryBot.factories.select { |f| f.build_class == Term }.each { |f| create(f.name) }
  end

  describe 'reading' do
    describe :index do
      it 'returns the terms' do
        get terms_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(Term.all)
      end
    end
  end
end
