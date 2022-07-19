class CorsHelper < ActionDispatch::HostAuthorization::Permissions
  include BerkeleyLibrary::Logging

  def initialize
    hosts = Rails.application.config.hosts
    super hosts
  end

  class << self
    def allow?(source, env = Rails.env)
      CorsHelper.new.allow?(source, env)
    end
  end

  def allow?(source, _env)
    return true if empty?
    return false unless (source_uri = safe_parse_uri(source))

    allows?(source_uri.host).tap do |allowed|
      message = [].tap do |msg|
        msg << (allowed ? 'Allowing' : 'Disallowing')
        msg << "cross-origin request from #{source_uri.host}"
        msg << "(source URI: #{source_uri})"
      end.join(' ')

      logger.info(message)
    end
  end

  private

  def safe_parse_uri(url)
    URI.parse(url)
  rescue URI::InvalidURIError => e
    logger.error("Error parsing source URL #{url.inspect}", e)
    nil
  end
end
