require 'berkeley_library/logging'

module Docker
  class Secret
    class << self
      include BerkeleyLibrary::Logging

      def setup_environment!(fileglob = '/run/secrets/*')
        Dir[fileglob].each(&method(:set_env_from))
      end

      private

      # rubocop:disable Naming/AccessorMethodName
      def set_env_from(filepath)
        secret = File.read(filepath)
        secret_name = File.basename(filepath)
        return logger.warn("Can't set ENV[#{secret_name}]; #{filepath} is empty") if secret.empty?

        logger.info("Setting ENV[#{secret_name}] from #{filepath}").tap do
          ENV[secret_name] = secret
        end
      end
      # rubocop:enable Naming/AccessorMethodName
    end
  end

  class << self
    def running_in_container?
      File.exist? '/.dockerenv'
    end
  end
end
