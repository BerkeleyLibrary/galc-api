class SessionsController < ApplicationController
  ERR_TICKET_MISMATCH = 'Ticket from callback URL parameter does not match credential from OmniAuth hash'.freeze

  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })
    validate_ticket!

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

  def callback_params
    params.permit(:ticket)
  end

  def ticket_param
    callback_params.require(:ticket)
  end

  def credentials
    auth_hash && auth_hash['credentials']
  end

  def ticket_credential
    credentials && credentials['ticket']
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin} is not on the allow list"
  end

  def validate_ticket!
    return if ticket_credential == ticket_param

    raise Error::UnauthorizedError, "#{ERR_TICKET_MISMATCH}: expected #{ticket_credential.inspect}, was #{ticket_param.inspect}"
  end
end
