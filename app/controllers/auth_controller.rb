require 'berkeley_library/util/uris'

class AuthController < ApplicationController
  ERR_TICKET_MISMATCH = 'Ticket from callback URL parameter does not match credential from OmniAuth hash'.freeze

  # Debug UI for staging, 404 Not Found for production
  def index
    raise Error::NotFoundError if ENV['SERVE_TEST_UI'].blank?

    # TODO: Something more elegant
    # Hack to get around the fact that API-only apps don't include an HTML renderer
    pathname = Rails.root.join('public', 'index.html')
    render xml: File.read(pathname), content_type: 'text/html'
  end

  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash, params: params.to_unsafe_h })

    # TODO: Store CalNet user in the session & compare token w/session
    user = User.from_omniauth(auth_hash)
    redirect_url = append_token(omniauth_origin, user.to_jwt_payload)

    redirect_to(redirect_url, allow_other_host: true)
  end

  def logout
    redirect_to(cas_logout_url, allow_other_host: true)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def omniauth_origin
    ensure_valid_origin(raw_origin)
  end

  def raw_origin
    # TODO: Figure out why we can't depend on omniauth.origin --
    #       should we be setting `origin_param: 'url'` in initializers/omniauth.rb?
    logger.debug("AuthController#raw_origin: request.env['omniauth.origin'] = #{request.env['omniauth.origin'].inspect}")
    logger.debug("AuthController#raw_origin: params['url'] = #{params['url'].inspect}")
    request.env['omniauth.origin'] || params['url']
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin.inspect} is not on the allow list"
  end

  def cas_base_uri
    URI.parse("https://#{Rails.application.config.cas_host}")
  end

  def cas_logout_url
    BerkeleyLibrary::Util::URIs.append(cas_base_uri, '/cas/logout').to_s
  end
end
