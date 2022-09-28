require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  before do
    create_all(Item)
  end

  describe :create do
    attr_reader :item, :payload

    before do
      @item = Item.take
      @payload = {
        data: {
          type: 'reservation',
          relationships: {
            item: {
              data: { type: 'item', id: item.id }
            }
          }
        }
      }
    end

    it 'requires authentication' do
      post(reservations_url, params: payload, as: :jsonapi)
      expect(response).to have_http_status(:unauthorized)
    end

    context 'as patron' do
      include_context 'patron request'

      it 'creates a request' do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(true)

        post(reservations_url, params: payload, as: :jsonapi)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)
        parsed_response = JSON.parse(response.body)

        expected_rsvn = Reservation.new(user: current_user, item: item)

        expect(parsed_response).to contain_jsonapi_for(expected_rsvn)
      end

      # rubocop:disable RSpec/ExampleLength
      it 'sends a request email' do
        expected_to = Rails.application.config.reserve_email_to
        expect(expected_to).not_to be_blank # just to be sure

        expected_bcc = %w[test@example.org test@example.edu]
        bcc_str = expected_bcc.join(', ')

        allow(Rails.application.config).to receive(:reserve_email_bcc).and_return(bcc_str)
        allow(AvailabilityService).to receive(:available?).with(item).and_return(true)

        expect { post(reservations_url, params: payload, as: :jsonapi) }
          .to(change { ActionMailer::Base.deliveries.count }.by(1))

        message = ActionMailer::Base.deliveries.last
        expect(message).not_to be_nil

        aggregate_failures do
          expect(message.subject).to eq(ReservationMailer::RSVN_REQ_SUBJECT)
          expect(message.from).to include(ApplicationMailer::ADDR_LIB_NOREPLY)
          expect(message.to).to include(expected_to)
          expect(message.cc).to include(current_user.email)

          expected_bcc.each do |attr|
            expect(message.bcc).to include(attr)
          end

          [
            current_user.display_name,
            current_user.email,
            current_user.uid,
            item.artist,
            item.title,
            item.mms_id,
            item.size
          ].each do |attr|
            expect(message.body).to include(attr)
          end

        end
      end
      # rubocop:enable RSpec/ExampleLength

      it 'rejects a nonexistent item' do
        Item.destroy_by(id: item.id)

        post(reservations_url, params: payload, as: :jsonapi)
        expect(response).to have_http_status(:not_found)
      end

      it 'rejects an unavailable item' do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(false)

        post(reservations_url, params: payload, as: :jsonapi)
        expect(response).to have_http_status(:unprocessable_entity)

        invalid_rsvn = Reservation.new(user: current_user, item: item).tap(&:validate)
        expected_errors = invalid_rsvn.errors

        actual_errors = JSON.parse(response.body)['errors']
        expect(actual_errors.size).to eq(expected_errors.size)

        expected_errors.each_with_index do |expected, i|
          actual = actual_errors[i]
          expect(actual).to contain_jsonapi_for(expected)
        end
      end

      it 'returns 403 Forbidden for an attempt to reserve during a closure' do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(true)

        create(:closure, start_date: Date.current - 1, end_date: Date.current + 1)
        expect(Closure.current).to exist # just to be sure

        post(reservations_url, params: payload, as: :jsonapi)
        expect(response).to have_http_status(:forbidden)

        parsed_response = JSON.parse(response.body)

        expected_rsvn = Reservation.new(user: current_user, item: item)
        expect(parsed_response).not_to contain_jsonapi_for(expected_rsvn)
      end
    end
  end
end
