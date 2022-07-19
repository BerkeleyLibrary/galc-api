require 'rails_helper'

describe BuildInfo do
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

  describe :info do
    it 'returns the info' do
      expect(info.info).to eq(expected_info)
    end
  end

  describe :to_h do
    it 'returns the info' do
      expect(info.to_h).to eq(expected_info)
    end
  end

  describe :to_hash do
    it 'returns the info' do
      expect(info.to_hash).to eq(expected_info)
    end
  end

  describe 'accessors' do
    it 'returns the build value' do
      BuildInfo::BUILD_VARS.each do |v|
        attr = v.downcase
        expect(info).to respond_to(attr)
        expect(info.send(attr)).to eq(expected_info[v])
      end
    end
  end
end
