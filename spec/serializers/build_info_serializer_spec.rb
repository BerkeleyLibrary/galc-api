require 'rails_helper'
require 'support/build_info_context'

describe BuildInfoSerializer do
  include_context('mock build info') do
    it 'serializes the info' do
      expected_hash = {
        data: {
          id: expected_info[:GIT_COMMIT],
          type: :build_info,
          attributes: BuildInfoSerializer::SERIALIZED_ATTRS.to_h { |attr| [attr, info.send(attr)] }
        }
      }

      serializer = BuildInfoSerializer.new(info)
      actual_hash = serializer.serializable_hash
      expect(actual_hash).to deep_eq_hash(expected_hash)
    end
  end
end
