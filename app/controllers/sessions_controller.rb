class SessionsController < ApplicationController
  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })

    session[User::SESSION_KEY] = User.from_omniauth(auth_hash)
    redirect_to(omniauth_origin, allow_other_host: true)
  end

  private

  def url_param
    callback_params.require(:url)
  end

  def ticket_param
    callback_params.require(:ticket)
  end

  def omniauth_origin
    ensure_valid_origin(request.env['omniauth.origin'])
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def callback_params
    params.permit(:url, :ticket)
  end

  # TODO: Can we intercept the original /auth/cas call and enforce this there as well?
  def ensure_valid_origin(origin)
    return origin if CorsHelper.allow?(origin)

    raise ActionController::Redirecting::UnsafeRedirectError, "Provided origin URL #{origin} is not on the allow list"
  end
end
