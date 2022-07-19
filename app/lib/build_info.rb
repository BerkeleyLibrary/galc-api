require 'berkeley_library/logging'

class BuildInfo
  BUILD_VARS = %i[CI BUILD_TIMESTAMP BUILD_URL DOCKER_TAG GIT_BRANCH GIT_COMMIT GIT_URL].freeze

  attr_reader :info

  def initialize(env = ENV)
    @info = info_from_env(env)
  end

  alias to_h info
  alias to_hash info

  def method_missing(method_name, *args, &block)
    (k = as_key(method_name)) ? info[k] : super
  end

  def respond_to_missing?(method_name, _include_private = false)
    as_key(method_name).present?
  end

  private

  def as_key(method_name)
    return if (k_str = method_name.to_s.upcase).blank?

    k_sym = k_str.to_sym
    k_sym if BUILD_VARS.include?(k_sym)
  end

  def info_from_env(env)
    BUILD_VARS.filter_map { |var| (v = env[var.to_s]) && [var, v] }.to_h.freeze
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
