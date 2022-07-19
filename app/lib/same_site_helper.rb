class SameSiteHelper
  include BerkeleyLibrary::Logging

  class << self
    def same_site_value_for(request)
      helper = SameSiteHelper.new(request)
      helper.same_site_value
    end
  end

  attr_reader :request

  def initialize(request)
    @request = request
  end

  def same_site_value
    return :lax unless disable_ssp?

    # TODO: something less side-effect-y
    # Setting 'SameSite: None' requires setting 'Secure'
    request.session.options[:secure] = true

    :none
  end

  def disable_ssp?
    # Setting 'SameSite: None' requires setting 'Secure'; setting 'Secure' requires HTTPS
    return false unless https?

    CorsHelper.allow?(origin, request_env)
  end

  private

  def https?
    base_uri && base_uri.scheme == 'https'
  end

  def base_uri
    return @base_uri if instance_variable_defined?(:@base_uri)

    @base_uri = safe_parse_uri(request.base_url)
  end

  def request_env
    @request_env ||= request.env
  end

  def origin
    return @origin if instance_variable_defined?(:@origin)

    @origin = (request_env[Rack::Cors::HTTP_ORIGIN] || request_env[Rack::Cors::HTTP_X_ORIGIN])
  end

  # TODO: share code w/CorsHelper
  def safe_parse_uri(url)
    URI.parse(url)
  rescue URI::InvalidURIError => e
    logger.error("Error parsing source URL #{url.inspect}", e)
    nil
  end
end
