require 'berkeley_library/util/uris'

class AuthController < ApplicationController
  LOGIN_PARAM = 'login'.freeze
  ERR_TICKET_MISMATCH = 'Ticket from callback URL parameter does not match credential from OmniAuth hash'.freeze

  def index
    raise Error::NotFoundError
  end

  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })

    user = User.from_omniauth(auth_hash)
    session[User::SESSION_KEY] = user.serializable_hash

    redirect_url = append_login_param(omniauth_origin)
    redirect_to(redirect_url, allow_other_host: true)
  end

  def logout
    reset_session
    redirect_to(cas_logout_url, allow_other_host: true)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def omniauth_origin
    ensure_valid_origin(request.env['omniauth.origin'])
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin} is not on the allow list"
  end

  def append_login_param(url)
    URI.parse(url).tap do |uri|
      params = param_hash_from(uri)
      params[LOGIN_PARAM] = 'true'
      uri.query = URI.encode_www_form(params)
    end.to_s
  end

  def cas_base_uri
    URI.parse("https://#{Rails.application.config.cas_host}")
  end

  def cas_logout_url
    BerkeleyLibrary::Util::URIs.append(cas_base_uri, '/cas/logout').to_s
  end

  def param_hash_from(uri)
    return {} unless (query = uri.query)

    CGI.parse(query)
  end
end
