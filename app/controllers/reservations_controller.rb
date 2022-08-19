class ReservationsController < ApplicationController
  include JSONAPI::Deserialization

  before_action :authenticate!, only: %i[create]

  # POST /requests
  def create
    item_id = reservation_params['item_id']
    @reservation = Reservation.new(user: current_user, item: Item.find(item_id)).tap(&:validate!)

    mailer = ReservationMailer.with(reservation: @reservation)
    reservation_request_email = mailer.reservation_request_email
    log_headers(reservation_request_email)
    reservation_request_email.deliver_now

    render jsonapi: @reservation, status: :created, location: @reservation
  end

  private

  def log_headers(email)
    header_lines = email.header.to_s.lines(chomp: true)
    logger.info('Sending reservation email', email_headers: header_lines)
  end

  def reservation_params
    @reservation_params ||= jsonapi_deserialize(params, only: 'item')
  end
end
