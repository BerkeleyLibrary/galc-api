require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe :current do
    it 'requires authentication' do
      get(user_url, as: :jsonapi)
      expect(response).to have_http_status(:unauthorized)
    end

    context 'as patron' do
      include_context 'patron request'

      it 'returns the user' do
        user = User.from_session(session)

        get(user_url, as: :jsonapi)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(user)
      end
    end
  end
end
