require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    # misusing an internal API, but what can you do?
    # https://github.com/thoughtbot/factory_bot/issues/1534
    FactoryBot.factories.each { |f| create(f.name) if f.build_class == Item }
  end

  describe 'reading' do
    describe :index do
      it 'returns the items' do
        expect(Item).to exist # just to be sure

        get items_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to be_a(Hash)

        data = parsed_response['data']
        expected_json = Item.all.map { |i| jsonapi_for(i) }
        expect(data).to match_array(expected_json)
      end
    end

    describe :show do
      it 'returns an item' do
        item = Item.take
        get item_url(item)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to be_a(Hash)

        result = parsed_response['data']
        expect(result).to be_jsonapi_for(item)
      end
    end
  end

  describe 'writing' do
    let(:valid_attributes) do
      {
        image: 'viera da silva (composition).jpg',
        image_base: 'viera da silva (composition)',
        title: 'Composition (Le Gardin)',
        artist: 'Vieira da Silva, Maria Elena',
        artist_url: 'https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva',
        date: '1959',
        decade: '1950-1959',
        description: 'Annotated "Epreuve d\'artiste."',
        medium: 'Serigraph',
        colors: 'Color',
        genre: 'Still Life',
        dimensions: '19 x 15"',
        size: 'Small',
        series: 'Artist\'s Proof',
        bib_number: 'b16398237',
        mms_id: '991051333089706532',
        barcode: 'c093329284',
        circulation: 'NON-CIRC',
        location: 'Stored in box',
        value: '800',
        appraisal_date: '2006',
        notes: '17741786',
        reserve_date: Date.new(2019, 9, 16) # '2019-09-16'
      }
    end

    def expected_errors_for(invalid_attributes, item_to_update: nil)
      item = item_to_update ? Item.find(item_to_update.id) : Item.new
      item.tap do |it|
        it.assign_attributes(**invalid_attributes)
        it.validate
      end.errors
    end

    # TODO: use UUIDs for top-level ID

    describe :create do
      describe 'success' do
        it 'creates an item' do
          payload = { data: { type: 'item', attributes: valid_attributes } }
          expect { post items_url, params: payload, as: :jsonapi }.to change(Item, :count).by(1)

          expect(response).to have_http_status(:created)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          parsed_response = JSON.parse(response.body)
          response_data = parsed_response['data']

          item = Item.find(response_data['id'].to_i)
          expect(item).not_to be_nil
          valid_attributes.each { |attr, val| expect(item.send(attr)).to eq(val) }

          expect(response_data).to be_jsonapi_for(item)
          expect(response.headers['Location']).to eq(item_url(item))
        end

        it 'accepts a nil MMS ID' do
          attributes = valid_attributes.except(:mms_id)

          payload = { data: { type: 'item', attributes: attributes } }
          expect { post items_url, params: payload, as: :jsonapi }.to change(Item, :count).by(1)

          expect(response).to have_http_status(:created)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          parsed_response = JSON.parse(response.body)
          response_data = parsed_response['data']

          item = Item.find(response_data['id'].to_i)
          expect(item).not_to be_nil
          attributes.each { |attr, val| expect(item.send(attr)).to eq(val) }

          expect(response_data).to be_jsonapi_for(item)
          expect(response.headers['Location']).to eq(item_url(item))
        end
      end

      describe 'failure' do
        it 'fails with 422 Unprocessable Entity for a missing title' do
          invalid_attributes = valid_attributes.except(:title)
          payload = { data: { type: 'item', attributes: invalid_attributes } }

          allow(Rails.logger).to receive(:error)
          expect { post items_url, params: payload, as: :jsonapi }.not_to change(Item, :count)
          expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          expected_errors = expected_errors_for(invalid_attributes)
          expect(expected_errors).not_to be_empty # just to be sure

          actual_errors = JSON.parse(response.body)['errors']
          expect(actual_errors).to be_a(Array)

          expected_errors.each { |expected| expect(actual_errors).to include(jsonapi_for(expected)) }
        end

        it 'fails with 422 Unprocessable Entity for a duplicate MMS ID' do
          existing_mms_id = Item.pluck(:mms_id).compact.first
          invalid_attributes = valid_attributes.merge({ mms_id: existing_mms_id })
          payload = { data: { type: 'item', attributes: invalid_attributes } }

          allow(Rails.logger).to receive(:error)
          expect { post items_url, params: payload, as: :jsonapi }.not_to change(Item, :count)
          expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          expected_errors = expected_errors_for(invalid_attributes)
          expect(expected_errors).not_to be_empty # just to be sure

          actual_errors = JSON.parse(response.body)['errors']
          expect(actual_errors).to be_a(Array)

          expected_errors.each { |expected| expect(actual_errors).to include(jsonapi_for(expected)) }
        end

        xit 'returns 403 forbidden for a client-generated ID'
      end
    end

    describe :update do
      describe 'success' do
        it 'updates an item' do
          item = Item.take

          old_attributes = item.attributes.slice(*Item::EDIT_ATTRS)
          new_attributes = old_attributes.transform_values.with_index { |v, i| (i % 3 == 0) && v.is_a?(String) ? "#{v} (new)" : v }

          payload = { data: { type: 'item', id: item.id.to_s, attributes: new_attributes } }
          patch item_url(item), params: payload, as: :jsonapi

          expect(response).to have_http_status(:ok)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          item.reload
          old_attributes.merge(new_attributes).each { |attr, val| expect(item.send(attr)).to eq(val), "Wrong value for #{attr}" }

          response_data = JSON.parse(response.body)['data']
          expect(response_data).to be_jsonapi_for(item)
        end
      end

      describe 'failure' do
        it 'fails with 422 Unprocessable Entity for a missing title' do
          item = Item.take

          invalid_attributes = { title: nil }
          payload = { data: { type: 'item', id: item.id.to_s, attributes: invalid_attributes } }

          allow(Rails.logger).to receive(:error)
          patch item_url(item), params: payload, as: :jsonapi
          expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          expected_errors = expected_errors_for(invalid_attributes, item_to_update: item)
          expect(expected_errors).not_to be_empty # just to be sure

          actual_errors = JSON.parse(response.body)['errors']
          expect(actual_errors).to be_a(Array)

          expected_errors.each { |expected| expect(actual_errors).to include(jsonapi_for(expected)) }
        end

        it 'fails with 422 Unprocessable Entity for a duplicate MMS ID' do
          item = Item.take

          mms_id = Item.pluck(:mms_id).find { |id| id && id != item.mms_id }

          invalid_attributes = { mms_id: mms_id }
          payload = { data: { type: 'item', id: item.id.to_s, attributes: invalid_attributes } }

          allow(Rails.logger).to receive(:error)
          patch item_url(item), params: payload, as: :jsonapi
          expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordInvalid))

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

          expected_errors = expected_errors_for(invalid_attributes, item_to_update: item)
          expect(expected_errors).not_to be_empty # just to be sure

          actual_errors = JSON.parse(response.body)['errors']
          expect(actual_errors).to be_a(Array)

          expected_errors.each { |expected| expect(actual_errors).to include(jsonapi_for(expected)) }
        end

        xit 'returns 409 conflict for an invalid type'
        xit 'returns 409 conflict for an ID that does not match the URL'
        xit 'returns 404 not found for a nonexistent object'
      end
    end

    describe :destroy do
      describe 'success' do
        it 'deletes an item' do
          item = Item.take
          expect { delete item_url(item), as: :json }.to change(Item, :count).by(-1)

          expect(response).to have_http_status(:no_content)
          expect(response.body).to be_empty

          expect(Item.where(id: item.id)).not_to exist
        end
      end

      describe 'failure' do
        it 'fails with 404 Not Found if the item already does not exist' do
          item = Item.take
          item.destroy!

          allow(Rails.logger).to receive(:error)
          expect { delete item_url(item), as: :json }.not_to change(Item, :count)
          expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordNotFound))

          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
