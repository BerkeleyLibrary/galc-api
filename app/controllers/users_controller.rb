class UsersController < ApplicationController
  before_action :authenticate!

  # GET /users/5551212, /users/current
  def show
    id_param = params.require(:id)
    raise Error::ForbiddenError unless current_user?(id_param)

    render jsonapi: current_user
  end

  private

  def current_user?(id_param)
    id_param == 'current' || id_param == current_user.uid
  end
end
