class ReservationsController < ApplicationController
  include JSONAPI::Deserialization

  before_action :authenticate!, only: %i[create]

  # POST /requests
  def create
    item_id = reservation_params['item_id']
    @reservation = Reservation.new(user: current_user, item: Item.find(item_id)).tap(&:validate!)

    mailer = ReservationMailer.with(reservation: @reservation)
    reservation_request_email = mailer.reservation_request_email
    logger.info('Sending reservation email', reservation_request_email.header)
    reservation_request_email.deliver_now

    render jsonapi: @reservation, status: :created, location: @reservation
  end

  private

  def reservation_params
    @reservation_params ||= jsonapi_deserialize(params, only: 'item')
  end
end
