class UsersController < ApplicationController
  before_action :authenticate!

  # GET /users/current
  def current
    render jsonapi: current_user
  end
end
