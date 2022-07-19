require 'rails_helper'

describe BuildInfoSerializer do
  let(:expected_info) do
    {
      BUILD_TIMESTAMP: '2022-06-16T18:35:25+00:00',
      BUILD_URL: 'https://github.com/BerkeleyLibrary/galc-api/actions/runs/2511017674',
      DOCKER_TAG: 'ghcr.io/berkeleylibrary/galc-api:78b93c1',
      GIT_BRANCH: 'main',
      GIT_COMMIT: '78b93c15701e3af2d9b25ce3a906981276f9e607',
      GIT_URL: 'git://github.com/BerkeleyLibrary/galc-api.git'
    }
  end

  attr_reader :info

  before do
    allow(ENV).to receive(:[]).and_wrap_original do |m, *args|
      if args.any? && (k = args[0]).respond_to?(:to_sym)
        k_sym = k.to_sym
        next expected_info[k_sym] if expected_info.key?(k_sym)
      end

      m.call(*args)
    end

    @info = BuildInfo.new
  end

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
