class ReservationsController < ApplicationController
  include JSONAPI::Deserialization

  before_action :authenticate!, only: %i[create]

  # POST /requests
  def create
    item_id = reservation_params['item_id']
    @reservation = Reservation.new(user: current_user, item: Item.find(item_id)).tap(&:validate!)
    render jsonapi: @reservation, status: :created, location: @reservation
  end

  private

  def reservation_params
    @reservation_params ||= jsonapi_deserialize(params, only: 'item')
  end
end
