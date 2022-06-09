require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe :current do
    it 'requires authentication' do
      get(current_user_url, as: :jsonapi)
      expect(response).to have_http_status(:unauthorized)
    end

    context 'as patron' do
      include_context 'patron request'

      it 'returns the user' do
        user = User.from_session(session)

        get(current_user_url)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(user)
      end
    end
  end

  describe :show do
    it 'requires authentication' do
      get user_url(id: '5551212')
      expect(response).to have_http_status(:unauthorized)
    end

    context 'as patron' do
      include_context 'patron request'

      it 'returns the user' do
        user = User.from_session(session)

        get user_url(id: user.uid)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(user)
      end

      it 'rejects a mismatched id' do
        user = User.from_session(session)
        get user_url(id: "not#{user.uid}")

        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
