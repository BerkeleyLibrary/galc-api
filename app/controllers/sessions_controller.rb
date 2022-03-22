class SessionsController < ApplicationController
  def callback
    logger.debug({ msg: 'Received omniauth callback', omniauth: auth_hash })

    session[User::SESSION_KEY] = User.from_omniauth(auth_hash)
  end

  private

  def url_param
    callback_params.require(:url)
  end

  def ticket_param
    callback_params.require(:ticket)
  end

  def omniauth_origin
    request.env['omniauth.origin']
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def callback_params
    params.permit(:url, :ticket)
  end
end
