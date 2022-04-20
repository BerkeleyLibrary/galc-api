require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    # misusing an internal API, but what can you do?
    # https://github.com/thoughtbot/factory_bot/issues/1534
    FactoryBot.factories.select { |f| f.build_class == Item }.each { |f| create(f.name) }
  end

  describe 'reading' do
    describe :index do
      it 'returns the items' do
        expect(Item).to exist # just to be sure

        get items_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        links = parsed_response.delete('links')

        # TODO: test pagination properly
        expect(links['self']).to eq(items_url)
        expect(links['current']).to eq("#{items_url}?page[number]=1")

        expected_data = Item.includes(:terms).all
        expect(parsed_response).to contain_jsonapi_for(expected_data)
      end

      it 'accepts JSONAPI include parameters' do
        get items_url, params: { include: 'terms,terms.facet' }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        links = parsed_response.delete('links')
        expect(links['self']).to eq("#{items_url}?include=terms%2Cterms.facet")
        expect(links['current']).to eq("#{items_url}?include=terms,terms.facet&page[number]=1")

        expected_data = Item.includes(:terms).all
        expect(parsed_response).to contain_jsonapi_for(expected_data, { include: %i[terms terms.facet] })
      end

      it 'supports searches by facet' do
        facet_values = { 'Medium' => %w[Etching Lithograph], 'Genre' => %w[Landscape Figurative] }
        get items_url, params: { filter: facet_values }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        _links = parsed_response.delete('links')
        # expect(links['self']).to eq("#{items_url}?include=terms%2Cterms.facet")
        # expect(links['current']).to eq("#{links['self']}&page[number]=1")

        expected_data = Item.with_facet_values(facet_values)
        expect(parsed_response).to contain_jsonapi_for(expected_data)
      end
    end

    describe :show do
      it 'returns an item' do
        item = Item.take
        get item_url(item)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        links = parsed_response.delete('links')
        expect(links['self']).to eq(item_url(item))

        expect(parsed_response).to contain_jsonapi_for(item)
      end

      it 'includes the terms' do
        item = Item.take

        get item_url(item)
        parsed_response = JSON.parse(response.body)
        data = parsed_response['data']

        terms_data = data['relationships']['terms']['data']

        expected_count = item.terms.count
        expect(expected_count).to be > 0 # just to be sure

        expect(terms_data).to be_a(Array)
        expected_terms_data = item.terms.map { |t| { 'type' => 'term', 'id' => t.id.to_s } }
        expect(terms_data).to contain_exactly(*expected_terms_data)
      end
    end
  end

  describe 'writing' do
    let(:valid_attributes) do
      {
        image: 'viera da silva (composition).jpg',
        title: 'Composition (Le Gardin)',
        artist: 'Vieira da Silva, Maria Elena',
        artist_url: 'https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva',
        date: '1959',
        # decade: '1950-1959',
        description: 'Annotated "Epreuve d\'artiste."',
        # medium: 'Serigraph',
        # colors: 'Color',
        # genre: 'Still Life',
        dimensions: '19 x 15"',
        # size: 'Small',
        series: 'Artist\'s Proof',
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

    context 'as admin' do
      include_context 'admin request'

      def expected_errors_for(invalid_attributes, item_to_update: nil)
        (item_to_update ? Item.find(item_to_update.id) : Item.new).tap do |item|
          item.assign_attributes(**invalid_attributes)
          item.validate
          expect(item).not_to be_valid # just to be sure
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
            item_id = parsed_response['data']['id'].to_i

            item = Item.find(item_id)
            expect(item).not_to be_nil
            valid_attributes.each { |attr, val| expect(item.send(attr)).to eq(val) }

            links = parsed_response.delete('links')
            expect(links['self']).to eq(items_url)

            expect(parsed_response).to contain_jsonapi_for(item)
            expect(response.headers['Location']).to eq(item_url(item))
          end

          it 'sets the terms' do
            expected_terms = Facet.all.map { |f| f.terms.take }
            payload = {
              data: {
                type: 'item',
                attributes: valid_attributes,
                relationships: {
                  terms: {
                    data: expected_terms.map { |t| { 'type' => 'term', 'id' => t.id.to_s } }
                  }
                }
              }
            }
            expect { post items_url, params: payload, as: :jsonapi }.to change(Item, :count).by(1)

            expect(response).to have_http_status(:created)
            parsed_response = JSON.parse(response.body)

            item = Item.find(parsed_response['data']['id'].to_i)
            expect(item.terms).to contain_exactly(*expected_terms)
          end

          it 'accepts a nil MMS ID' do
            attributes = valid_attributes.except(:mms_id)

            payload = { data: { type: 'item', attributes: attributes } }
            expect { post items_url, params: payload, as: :jsonapi }.to change(Item, :count).by(1)

            expect(response).to have_http_status(:created)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            parsed_response = JSON.parse(response.body)
            item_id = parsed_response['data']['id'].to_i

            item = Item.find(item_id)
            expect(item).not_to be_nil
            attributes.each { |attr, val| expect(item.send(attr)).to eq(val) }

            links = parsed_response.delete('links')
            expect(links['self']).to eq(items_url)

            expect(parsed_response).to contain_jsonapi_for(item)
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

            actual_errors = JSON.parse(response.body)['errors']
            expected_errors = expected_errors_for(invalid_attributes)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
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

            actual_errors = JSON.parse(response.body)['errors']
            expected_errors = expected_errors_for(invalid_attributes)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
          end

          it 'fails with 404 Not Found for an invalid term' do
            invalid_id = Term.maximum(:id) + 999
            payload = {
              data: {
                type: 'item',
                attributes: valid_attributes,
                relationships: {
                  terms: {
                    data: [{ 'type' => 'term', 'id' => invalid_id.to_s }]
                  }
                }
              }
            }

            allow(Rails.logger).to receive(:error)
            expect { post items_url, params: payload, as: :jsonapi }.not_to change(Item, :count)
            expect(Rails.logger).to have_received(:error).with(kind_of(ActiveRecord::RecordNotFound))

            expect(response).to have_http_status(:not_found)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            actual_errors = JSON.parse(response.body)['errors']
            expect(actual_errors.size).to eq(1)
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

            parsed_response = JSON.parse(response.body)

            links = parsed_response.delete('links')
            expect(links['self']).to eq(item_url(item))

            expect(parsed_response).to contain_jsonapi_for(item)
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

            actual_errors = JSON.parse(response.body)['errors']
            expected_errors = expected_errors_for(invalid_attributes, item_to_update: item)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
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

            actual_errors = JSON.parse(response.body)['errors']
            expect(actual_errors).to be_a(Array)

            expected_errors = expected_errors_for(invalid_attributes, item_to_update: item)
            expected_json = expected_errors.map { |err| jsonapi_for(err) }
            expect(actual_errors).to contain_exactly(*expected_json)
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

    context 'as patron' do
      include_context 'patron request'

      describe :create do
        it 'returns 403 Forbidden' do
          count_before = Item.count

          payload = { data: { type: 'item', attributes: valid_attributes } }
          post items_url, params: payload, as: :jsonapi

          expect(response).to have_http_status(:forbidden)
          expect(Item.count).to eq(count_before)
        end
      end

      describe :update do
        it 'returns 403 Forbidden' do
          item = Item.take
          title_before = item.title

          payload = { data: { type: 'item', id: item.id.to_s, attributes: { title: 'The new title' } } }
          patch item_url(item), params: payload, as: :jsonapi

          expect(response).to have_http_status(:forbidden)

          item.reload
          expect(item.title).to eq(title_before)
        end
      end

      describe :destroy do
        it 'returns 403 Forbidden' do
          item = Item.take
          delete item_url(item), as: :json

          expect(response).to have_http_status(:forbidden)
          expect(Item.find(item.id)).to eq(item)
        end
      end
    end

    context 'without login' do
      describe :create do
        it 'returns 401 Unauthorized' do
          count_before = Item.count

          payload = { data: { type: 'item', attributes: valid_attributes } }
          post items_url, params: payload, as: :jsonapi

          expect(response).to have_http_status(:unauthorized)
          expect(Item.count).to eq(count_before)
        end
      end

      describe :update do
        it 'returns 401 Unauthorized' do
          item = Item.take
          title_before = item.title

          payload = { data: { type: 'item', id: item.id.to_s, attributes: { title: 'The new title' } } }
          patch item_url(item), params: payload, as: :jsonapi

          expect(response).to have_http_status(:unauthorized)

          item.reload
          expect(item.title).to eq(title_before)
        end
      end

      describe :destroy do
        it 'returns 401 Unauthorized' do
          item = Item.take
          delete item_url(item), as: :json

          expect(response).to have_http_status(:unauthorized)
          expect(Item.find(item.id)).to eq(item)
        end
      end
    end
  end
end
