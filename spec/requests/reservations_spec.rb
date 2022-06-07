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

        expected_rsvn = Reservation.new(user: User.from_session(session), item: item)

        expect(parsed_response).to contain_jsonapi_for(expected_rsvn)
      end

      it 'rejects a nonexistent item' do
        Item.destroy_by(id: item.id)

        post(reservations_url, params: payload, as: :jsonapi)
        expect(response).to have_http_status(:not_found)
      end

      it 'rejects an unavailable item' do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(false)

        post(reservations_url, params: payload, as: :jsonapi)
        expect(response).to have_http_status(:unprocessable_entity)

        invalid_rsvn = Reservation.new(user: User.from_session(session), item: item).tap(&:validate)
        expected_errors = invalid_rsvn.errors

        actual_errors = JSON.parse(response.body)['errors']
        expect(actual_errors.size).to eq(expected_errors.size)

        expected_errors.each_with_index do |expected, i|
          actual = actual_errors[i]
          expect(actual).to contain_jsonapi_for(expected)
        end
      end
    end
  end
end
