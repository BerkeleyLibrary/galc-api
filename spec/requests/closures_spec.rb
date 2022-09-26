require 'rails_helper'

RSpec.describe 'Closures', type: :request do
  before do
    create_all(Closure)
  end

  describe 'reading' do
    describe :show do
      it 'returns a closure' do
        closure = Closure.take
        get closure_url(closure)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to contain_jsonapi_for(closure)
      end
    end

    describe :index do
      it 'returns the closures' do
        expect(Closure).to exist # just to be sure

        get closures_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        expected_closures = Closure.all
        expect(parsed_response).to contain_jsonapi_for(expected_closures)
      end

      it 'supports filtering by current=true' do
        create(:closure, start_date: Date.current - 1.days, end_date: Date.current + 1.days)
        get closures_url, params: { 'filter[current]' => 'true' }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        expected_closures = Closure.current
        expect(parsed_response).to contain_jsonapi_for(expected_closures)
      end

      it 'supports filtering by current=false' do
        create(:closure, start_date: Date.current - 1.days, end_date: Date.current + 1.days)
        get closures_url, params: { 'filter[current]' => 'false' }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        expected_closures = Closure.where.not(id: Closure.current)
        expect(parsed_response).to contain_jsonapi_for(expected_closures)
      end
    end
  end

  describe 'writing' do
    let(:valid_attributes) do
      {
        start_date: Date.new(2001, 2, 3),
        end_date: Date.new(2004, 5, 6),
        note: 'Test'
      }
    end

    context 'as admin' do
      include_context 'admin request'

      # TODO: share code with items_spec
      def expected_errors_for(invalid_attributes, closure_to_update: nil)
        (closure_to_update ? Closure.find(closure_to_update.id) : Closure.new).tap do |closure|
          closure.assign_attributes(**invalid_attributes)
          closure.validate
          expect(closure).not_to be_valid # just to be sure
        end.errors
      end

      describe :create do
        describe 'success' do
          it 'creates a closure' do
            payload = { data: { type: 'closure', attributes: valid_attributes } }
            expect { post closures_url, params: payload, as: :jsonapi }.to change(Closure, :count).by(1)

            expect(response).to have_http_status(:created)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            parsed_response = JSON.parse(response.body)
            closure_id = parsed_response['data']['id'].to_i

            closure = Closure.find(closure_id)
            expect(closure).not_to be_nil
            valid_attributes.each { |attr, val| expect(closure.send(attr)).to eq(val) }

            expect(parsed_response).to contain_jsonapi_for(closure)
            expect(response.headers['Location']).to eq(closure_url(closure))
          end
        end

        describe 'failure' do
          it 'fails with 422 Unprocessable Entity for a missing start date' do
            invalid_attributes = valid_attributes.except(:start_date)
            payload = { data: { type: 'closure', attributes: invalid_attributes } }

            allow(Rails.logger).to receive(:error)
            expect { post closures_url, params: payload, as: :jsonapi }.not_to change(Closure, :count)
            expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            actual_errors = JSON.parse(response.body)['errors']
            expected_errors = expected_errors_for(invalid_attributes)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
          end

          it 'fails with 422 Unprocessable Entity for an invalid date range' do
            invalid_attributes = valid_attributes.merge(
              start_date: valid_attributes[:end_date],
              end_date: valid_attributes[:start_date]
            )

            payload = { data: { type: 'closure', attributes: invalid_attributes } }

            allow(Rails.logger).to receive(:error)
            expect { post closures_url, params: payload, as: :jsonapi }.not_to change(Closure, :count)
            expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            actual_errors = JSON.parse(response.body)['errors']
            expected_errors = expected_errors_for(invalid_attributes)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
          end
        end
      end

      describe :update do
        describe 'success' do
          it 'updates a closure' do
            closure = Closure.where.not(end_date: nil).take
            old_attributes = closure.attributes.slice(*Closure::EDIT_ATTRS)

            new_end_date = closure.end_date + 1.days
            expected_attributes = old_attributes.merge(end_date: new_end_date)

            payload = { data: { type: 'closure', id: closure.id.to_s, attributes: { end_date: new_end_date } } }
            patch closure_url(closure), params: payload, as: :jsonapi

            expect(response).to have_http_status(:ok)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            closure.reload
            expected_attributes.each { |attr, val| expect(closure.send(attr)).to eq(val), "Wrong value for #{attr}" }

            parsed_response = JSON.parse(response.body)
            expect(parsed_response).to contain_jsonapi_for(closure)
          end
        end

        describe :failure do
          it 'fails with 422 Unprocessable Entity for a missing start_date' do
            closure = Closure.where.not(end_date: nil).take
            old_attributes = closure.attributes.slice(*Closure::EDIT_ATTRS)

            payload = { data: { type: 'closure', id: closure.id.to_s, attributes: { start_date: nil } } }

            allow(Rails.logger).to receive(:error)
            patch closure_url(closure), params: payload, as: :jsonapi
            expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            invalid_attributes = old_attributes.merge(start_date: nil)
            expected_errors = expected_errors_for(invalid_attributes, closure_to_update: closure)
            actual_errors = JSON.parse(response.body)['errors']
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)

            closure.reload
            old_attributes.each { |attr, val| expect(item.send(attr)).to eq(val), "Wrong value for #{attr}" }
          end

          it 'fails with 422 Unprocessable Entity for an invalid date range' do
            closure = Closure.where.not(end_date: nil).take
            old_attributes = closure.attributes.slice(*Closure::EDIT_ATTRS)

            bad_start_date = closure.end_date + 1.days
            payload = { data: { type: 'closure', id: closure.id.to_s, attributes: { start_date: bad_start_date } } }

            allow(Rails.logger).to receive(:error)
            patch closure_url(closure), params: payload, as: :jsonapi
            expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            invalid_attributes = old_attributes.merge(start_date: bad_start_date)
            expected_errors = expected_errors_for(invalid_attributes, closure_to_update: closure)
            actual_errors = JSON.parse(response.body)['errors']
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)

            closure.reload
            old_attributes.each { |attr, val| expect(item.send(attr)).to eq(val), "Wrong value for #{attr}" }
          end
        end

        describe :destroy do
          describe 'success' do
            it 'deletes an closure' do
              closure = Closure.take
              expect { delete closure_url(closure), as: :jsonapi }.to change(Closure, :count).by(-1)

              expect(response).to have_http_status(:no_content)
              expect(response.body).to be_empty

              expect(Closure.where(id: closure.id)).not_to exist
            end
          end

          describe :failure do
            it 'fails with 404 Not Found if the closure already does not exist' do
              closure = Closure.take
              closure.destroy!

              allow(Rails.logger).to receive(:error)
              expect { delete closure_url(closure), as: :jsonapi }.not_to change(Closure, :count)
              expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordNotFound))

              expect(response).to have_http_status(:not_found)
            end
          end
        end
      end
    end

    context 'as patron' do
      include_context 'patron request'

      describe :create do
        it 'returns 403 Forbidden' do
          count_before = Closure.count

          payload = { data: { type: 'closure', attributes: valid_attributes } }
          post closures_url, params: payload, as: :jsonapi

          expect(response).to have_http_status(:forbidden)
          expect(Closure.count).to eq(count_before)
        end
      end

      describe :update do
        it 'returns 403 Forbidden' do
          closure = Closure.take
          note_before = closure.note

          payload = { data: { type: 'closure', id: closure.id.to_s, attributes: { note: 'The new note' } } }
          patch closure_url(closure), params: payload, as: :jsonapi

          expect(response).to have_http_status(:forbidden)

          closure.reload
          expect(closure.note).to eq(note_before)
        end
      end

      describe :destroy do
        it 'returns 403 Forbidden' do
          closure = Closure.take
          delete closure_url(closure), as: :jsonapi

          expect(response).to have_http_status(:forbidden)
          expect(Closure.find(closure.id)).to eq(closure)
        end
      end
    end

    context 'without login' do
      describe :create do
        it 'returns 401 Unauthorized' do
          count_before = Closure.count

          payload = { data: { type: 'closure', attributes: valid_attributes } }
          post closures_url, params: payload, as: :jsonapi

          expect(response).to have_http_status(:unauthorized)
          expect(Closure.count).to eq(count_before)
        end
      end

      describe :update do
        it 'returns 401 Unauthorized' do
          closure = Closure.take
          note_before = closure.note

          payload = { data: { type: 'closure', id: closure.id.to_s, attributes: { note: 'The new note' } } }
          patch closure_url(closure), params: payload, as: :jsonapi

          expect(response).to have_http_status(:unauthorized)

          closure.reload
          expect(closure.note).to eq(note_before)
        end
      end

      describe :destroy do
        it 'returns 401 Unauthorized' do
          closure = Closure.take
          delete closure_url(closure), as: :jsonapi

          expect(response).to have_http_status(:unauthorized)
          expect(Closure.find(closure.id)).to eq(closure)
        end
      end
    end
  end
end
