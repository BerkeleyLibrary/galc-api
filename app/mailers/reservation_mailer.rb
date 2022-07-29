class ReservationMailer < ApplicationMailer
  RSVN_REQ_SUBJECT = 'GALC Reservation Request'.freeze

  def reservation_request_email
    @reservation = params[:reservation]

    mail(
      to: reserve_email_to,
      cc: @reservation.user.email,
      bcc: reserve_email_bcc,
      subject: RSVN_REQ_SUBJECT
    )
  end

  private

  def reserve_email_to
    return [] unless (email_to = Rails.application.config.reserve_email_to)

    email_to.split(',').map(&:strip)
  end

  def reserve_email_bcc
    return [] unless (email_bcc = Rails.application.config.reserve_email_bcc)

    email_bcc.split(',').map(&:strip)
  end
end
