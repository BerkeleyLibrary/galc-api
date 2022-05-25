require 'rails_helper'
require 'base64'

module Docker
  describe :running_in_container? do
    it 'checks for presence of /.dockerenv' do
      dockerenv_path = Pathname.new('/.dockerenv')
      expected_value = dockerenv_path.exist?
      expect(Docker.running_in_container?).to eq(expected_value)
    end
  end

  describe Secret do
    attr_reader :tmpdir_path

    before do
      tmpdir = Dir.mktmpdir(File.basename(__FILE__, '.rb'))
      @tmpdir_path = Pathname.new(tmpdir)
    end

    after do
      FileUtils.remove_dir(tmpdir_path, true)
    end

    describe :setup_environment! do
      attr_reader :secret_names
      attr_reader :secret_paths
      attr_reader :expected_secrets

      before do
        prefix = Time.now.to_i.to_s
        random = Random.new
        @secret_names = []
        @secret_paths = {}
        @expected_secrets = {}
        (0..8).each do |i|
          secret_names << (secret_name = "secret_#{prefix}_#{i}")
          secret_paths[secret_name] = (secret_path = tmpdir_path.join(secret_name))
          Base64.strict_encode64(random.bytes(128)).tap do |secret|
            expected_secrets[secret_name] = secret
            secret_path.binwrite(secret)
          end
        end
      end

      after do
        expected_secrets.each_key { |k| ENV.delete(k) }
      end

      it 'injects secrets into the environment' do
        Docker::Secret.setup_environment!("#{tmpdir_path}/*")
        expected_secrets.each do |secret_name, secret_value|
          expect(ENV[secret_name]).to eq(secret_value)
        end
      end

      it 'skips empty secrets' do
        n = secret_names.first
        secret_paths[n].binwrite('')
        Docker::Secret.setup_environment!("#{tmpdir_path}/*")
        expect(ENV[n]).to be_nil
      end
    end
  end
end
