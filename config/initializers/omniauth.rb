# omniauth-cas ignores the 'origin' parameter and uses
# the HTTP Referer, which doesn't include query parameters
# TODO: figure out why sending 'origin' as 'url' breaks things
# TODO: figure out something more elegant
module CASExtensions
  def return_url
    if (origin = request.params['origin'])
      return { url: origin }
    end

    super
  end
end

# Override the default 'puts' logger that Omniauth uses.
OmniAuth.config.logger = Rails.logger

# https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
OmniAuth.config.allowed_request_methods = [:post]

Rails.application.configure do
  cas_opts = {
    name: :calnet,
    host: config.cas_host,
    login_url: '/cas/login',
    service_validate_url: '/cas/p3/serviceValidate',
    fetch_raw_info: ->(_strategy, _opts, _ticket, _user_info, rawxml) {
      next {} if rawxml.empty?

      {
        'berkeleyEduIsMemberOf' => rawxml.xpath('//cas:berkeleyEduIsMemberOf').map(&:text),
        'berkeleyEduAffiliations' => rawxml.xpath('//cas:berkeleyEduAffiliations').map(&:text)
      }
    }
  }

  config.middleware.use(OmniAuth::Builder) { provider(:cas, **cas_opts) }

  config.to_prepare do
    OmniAuth::Strategies::CAS.class_eval { prepend CASExtensions }
  end
end
