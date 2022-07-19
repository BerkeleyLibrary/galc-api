class CorsHelper < ActionDispatch::HostAuthorization::Permissions
  include BerkeleyLibrary::Logging
  include BerkeleyLibrary::Util::URIs

  class << self
    def allow?(source, env = Rails.env)
      helper = CorsHelper.new(allowed_hosts)
      helper.allow?(source, env)
    end

    private

    def allowed_hosts
      config = Rails.application.config
      cors_hosts = (config.cors_hosts || [])
      cors_hosts + config.hosts # TODO: should we only do this in dev?
    end
  end

  def allow?(source, _env)
    return true if empty? # TODO: Is this appropriate?
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
end
