require 'berkeley_library/util/uris'

class AuthController < ApplicationController
  ERR_TICKET_MISMATCH = 'Ticket from callback URL parameter does not match credential from OmniAuth hash'.freeze

  def index
    raise Error::NotFoundError
  end

  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })

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
    ensure_valid_origin(request.env['omniauth.origin'])
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin} is not on the allow list"
  end

  def cas_base_uri
    URI.parse("https://#{Rails.application.config.cas_host}")
  end

  def cas_logout_url
    BerkeleyLibrary::Util::URIs.append(cas_base_uri, '/cas/logout').to_s
  end
end
