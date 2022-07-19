require 'rails_helper'
require 'support/build_info_context'

describe 'BuildInfo', type: :request do
  include_context('mock build info') do

    before do
      allow(BuildInfo).to receive(:build_info).and_return(info)
    end

    describe :index do
      it 'returns the build info' do
        expected_hash = {
          data: {
            id: expected_info[:GIT_COMMIT],
            type: 'build_info',
            attributes: BuildInfoSerializer::SERIALIZED_ATTRS.to_h { |attr| [attr, info.send(attr)] }
          }
        }.deep_stringify_keys

        get build_info_index_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to eq(expected_hash)
      end
    end
  end
end
