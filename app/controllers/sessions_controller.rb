class SessionsController < ApplicationController
  ERR_TICKET_MISMATCH = 'Ticket from callback URL parameter does not match credential from OmniAuth hash'.freeze

  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })

    session[User::SESSION_KEY] = User.from_omniauth(auth_hash)
    redirect_to(omniauth_origin, allow_other_host: true)
  end

  private

  def omniauth_origin
    ensure_valid_origin(request.env['omniauth.origin'])
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin} is not on the allow list"
  end
end