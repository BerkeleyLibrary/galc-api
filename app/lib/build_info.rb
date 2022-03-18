require 'berkeley_library/logging'

class BuildInfo
  BUILD_VARS = %w[CI BUILD_TIMESTAMP BUILD_URL DOCKER_TAG GIT_BRANCH GIT_COMMIT GIT_URL].freeze

  attr_reader :info

  def initialize(env = ENV)
    @info = info_from_env(env)
  end

  alias to_h info
  alias to_hash info

  private

  def info_from_env(env)
    BUILD_VARS.filter_map { |var| (v = env[var]) && [var.to_sym, v] }.to_h.freeze
  end

  class << self
    include BerkeleyLibrary::Logging

    def build_info
      @build_info ||= BuildInfo.new
    end

    def log!
      logger.info('Build', data: build_info)
    end
  end
end
