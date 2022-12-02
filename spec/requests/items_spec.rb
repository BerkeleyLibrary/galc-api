require 'rails_helper'

RSpec.shared_examples 'suppressed items are suppressed' do
  it 'excludes suppressed items' do
    expected_data = all_items.where(suppressed: false)
    expect(expected_data.count).to be > 0
    expect(all_items.count).to be > expected_data.count # just to be sure

    expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
    expected_meta = {
      availability: AvailabilityService.availability_for(expected_mms_ids),
      pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
    }

    get items_url, params: params

    expect(response).to be_successful
    expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

    parsed_response = JSON.parse(response.body)

    _links = parsed_response.delete('links')

    expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
  end
end

RSpec.describe 'Items', type: :request do
  before do
    create_all(Item)
    create_all(Term)
  end

  describe 'reading' do
    before do
      allow(AvailabilityService).to receive(:availability_for) do |mms_ids|
        mms_ids.compact.to_h do |mms_id|
          available = mms_id[mms_id.length / 2].to_i.odd?
          [mms_id, available]
        end
      end
    end

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

        expected_data = Item.includes(:terms)
        expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
        expected_meta = {
          availability: AvailabilityService.availability_for(expected_mms_ids),
          pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
        }
        expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
      end

      it 'includes current closure information if there is one' do
        closure = create(:closure, end_date: Date.current + 1)

        get items_url

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)
        parsed_response.delete('links') # simplify test

        expected_data = Item.includes(:terms)
        expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
        expected_meta = {
          availability: AvailabilityService.availability_for(expected_mms_ids),
          pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 },
          closure: ClosureSerializer.new(closure).serializable_hash
        }
        expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
      end

      it 'accepts JSONAPI include parameters' do
        get items_url, params: { include: 'terms,terms.facet' }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        links = parsed_response.delete('links')
        expect(links['self']).to eq("#{items_url}?include=terms%2Cterms.facet")
        expect(links['current']).to eq("#{items_url}?include=terms,terms.facet&page[number]=1")

        expected_data = Item.includes(:terms)
        expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
        expected_meta = {
          availability: AvailabilityService.availability_for(expected_mms_ids),
          pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
        }
        expect(parsed_response).to contain_jsonapi_for(expected_data, { include: %i[terms terms.facet], meta: expected_meta })
      end

      it 'supports searches by facet' do
        # NOTE: The query string format here follows JSONAPI recommendations, not Rails nested
        #       parameter conventions. See https://jsonapi.org/recommendations/#filtering
        facet_values = { 'Medium' => %w[Etching Lithograph], 'Genre' => %w[Landscape Figurative] }
        get items_url, params: facet_values.map { |f, vv| "filter[#{f}]=#{vv.join(',')}" }.join('&')

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        _links = parsed_response.delete('links')
        # expect(links['self']).to eq("#{items_url}?include=terms%2Cterms.facet")
        # expect(links['current']).to eq("#{links['self']}&page[number]=1")

        expected_data = Item.with_facet_values(facet_values)
        expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
        expected_meta = {
          availability: AvailabilityService.availability_for(expected_mms_ids),
          pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
        }
        expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
      end

      it 'supports keyword searches' do
        keywords = 'color medium numbered'
        get items_url, params: { 'filter[keywords]' => keywords }

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

        parsed_response = JSON.parse(response.body)

        _links = parsed_response.delete('links')

        expected_data = Item.with_all_keywords(keywords)
        expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
        expected_meta = {
          availability: AvailabilityService.availability_for(expected_mms_ids),
          pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
        }
        expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
      end

      context 'suppressed items' do

        let(:keywords) { 'color medium numbered' }

        attr_reader :all_items
        attr_reader :params

        before do
          @all_items = Item.with_all_keywords(keywords)
          expect(all_items.count).to be > 1 # just to be sure
          all_items.take.tap { |it| it.update(suppressed: true) }

          @params = { 'filter[keywords]' => keywords }
        end

        context 'without filter[suppressed]' do
          context 'without login' do
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as patron' do
            include_context 'patron request'
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as admin' do
            include_context 'admin request'
            it_behaves_like 'suppressed items are suppressed'
          end
        end

        context 'with filter[suppressed]=false' do
          before do
            params.merge!({ 'filter[suppressed]' => 'false' })
          end

          context 'without login' do
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as patron' do
            include_context 'patron request'
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as admin' do
            include_context 'admin request'
            it_behaves_like 'suppressed items are suppressed'
          end
        end

        context 'with filter[suppressed]=true,false' do
          before do
            params.merge!({ 'filter[suppressed]' => 'true,false' })
          end

          context 'without login' do
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as patron' do
            include_context 'patron request'
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as admin' do
            include_context 'admin request'

            it 'includes both suppressed and unsuppressed items' do
              expected_mms_ids = all_items.reorder(nil).pluck('DISTINCT(mms_id)')
              expected_meta = {
                availability: AvailabilityService.availability_for(expected_mms_ids),
                pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
              }

              get items_url, params: params

              expect(response).to be_successful
              expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

              parsed_response = JSON.parse(response.body)

              _links = parsed_response.delete('links')

              expect(parsed_response).to contain_jsonapi_for(all_items, { meta: expected_meta })
            end
          end
        end

        context 'with filter[suppressed]=true' do
          before do
            params.merge!({ 'filter[suppressed]' => 'true' })
          end

          context 'without login' do
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as patron' do
            include_context 'patron request'
            it_behaves_like 'suppressed items are suppressed'
          end

          context 'as admin' do
            include_context 'admin request'

            it 'includes only suppressed items' do
              expected_data = all_items.where(suppressed: true)
              expect(expected_data.count).to be > 0
              expect(all_items.count).to be > expected_data.count # just to be sure

              expected_mms_ids = expected_data.reorder(nil).pluck('DISTINCT(mms_id)')
              expected_meta = {
                availability: AvailabilityService.availability_for(expected_mms_ids),
                pagination: { current: 1, records: expected_mms_ids.count, offset: 0, limit: 30 }
              }

              get items_url, params: params

              expect(response).to be_successful
              expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

              parsed_response = JSON.parse(response.body)

              _links = parsed_response.delete('links')

              expect(parsed_response).to contain_jsonapi_for(expected_data, { meta: expected_meta })
            end
          end
        end
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

    def to_relationships(terms: nil, image: nil)
      {}.tap do |rels|
        rels[:terms] = { data: terms.map { |term| { type: 'term', id: term.id.to_s } } } if terms
        rels[:image] = { data: { type: 'image', id: image.id.to_s } } if image
      end
    end

    let(:valid_image) do
      basename = 'viera da silva (composition).jpg'
      thumbnail = 'viera da silva (composition)_360px.jpg'
      create(:image, basename: basename, thumbnail: thumbnail)
    end

    let(:valid_attributes) do
      {
        # image: 'viera da silva (composition).jpg',
        title: 'Composition (Le Gardin)',
        artist: 'Vieira da Silva, Maria Elena',
        artist_url: 'https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva',
        date: '1959',
        # decade: '1950-1959',
        description: 'Annotated "Epreuve d\'artiste."',
        # medium: ['Stencil', 'Serigraph'],
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

    let(:valid_terms) do
      factory_names = %i[term_1950_1959 term_serigraph term_stencil term_color term_still_life term_small]
      factory_names.map { |factory_name| create(factory_name) }
    end

    let(:valid_relationships) do
      to_relationships(terms: valid_terms, image: valid_image)
    end

    context 'as admin' do
      include_context 'admin request'

      # TODO: share code with closures_spec
      def expected_errors_for(attributes, terms: valid_terms, image: valid_image, item_to_update: nil)
        (item_to_update ? Item.find(item_to_update.id) : Item.new).tap do |item|
          Item.transaction do
            item.assign_attributes(**attributes)
            item.terms = terms
            item.image = image
            item.validate
            expect(item).not_to be_valid # just to be sure
            raise ActiveRecord::Rollback
          end
        end.errors
      end

      describe :create do
        describe 'success' do
          it 'creates an item' do
            payload = {
              data: {
                type: 'item',
                attributes: valid_attributes,
                relationships: valid_relationships
              }
            }
            expect { post items_url, params: payload, as: :jsonapi }.to change(Item, :count).by(1)

            expect(response).to have_http_status(:created)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            parsed_response = JSON.parse(response.body)
            item_id = parsed_response['data']['id'].to_i

            item = Item.find(item_id)
            expect(item).not_to be_nil
            valid_attributes.each { |attr, val| expect(item.send(attr)).to eq(val) }

            expect(item.terms).to contain_exactly(*valid_terms)

            links = parsed_response.delete('links')
            expect(links['self']).to eq(items_url)

            expect(parsed_response).to contain_jsonapi_for(item)
            expect(response.headers['Location']).to eq(item_url(item))
          end

          it 'accepts a nil MMS ID' do
            attributes = valid_attributes.except(:mms_id)

            payload = { data: { type: 'item', attributes: attributes, relationships: to_relationships(image: valid_image) } }
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
            payload = { data: { type: 'item', attributes: invalid_attributes, relationships: valid_relationships } }

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

          it 'fails with 422 Unprocessable Entity for a missing image' do
            payload = {
              data: {
                type: 'item',
                attributes: valid_attributes,
                relationships: to_relationships(terms: valid_terms)
              }
            }

            allow(Rails.logger).to receive(:error)
            expect { post items_url, params: payload, as: :jsonapi }.not_to change(Item, :count)
            expect(Rails.logger).to have_received(:error).with(kind_of(ActionController::ParameterMissing))

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            actual_errors = JSON.parse(response.body)['errors']
            expect(actual_errors.size).to eq(1)
          end

          it 'fails with 422 Unprocessable Entity for a duplicate MMS ID' do
            existing_mms_id = Item.pluck(:mms_id).compact.first
            invalid_attributes = valid_attributes.merge({ mms_id: existing_mms_id })
            payload = { data: { type: 'item', attributes: invalid_attributes, relationships: valid_relationships } }

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
                  },
                  image: {
                    data: { 'type' => 'image', 'id' => valid_image.id }
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

          it 'fails with 404 Not Found for a nonexistent image' do
            invalid_id = Image.maximum(:id) + 999
            payload = {
              data: {
                type: 'item',
                attributes: valid_attributes,
                relationships: {
                  image: {
                    data: { 'type' => 'image', 'id' => invalid_id.to_s }
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

          context 'multiple term validation' do
            attr_reader :singular_facets

            before do
              @singular_facets = Facet
                .where(allow_multiple: false)
                .where.not(name: 'Concept') # exclude mock facet
                .to_a
              expect(singular_facets.size).to be > 1 # just to be sure
            end

            it 'fails with 422 Unprocessable Entity for multiple term values on singular facets' do
              singular_facets.each do |facet|
                invalid_terms = facet.terms.limit(2)
                term_ids = invalid_terms.pluck(:id)
                expect(term_ids.size).to eq(2) # just to be sure

                payload = {
                  data: {
                    type: 'item',
                    attributes: valid_attributes,
                    relationships: {
                      terms: {
                        data: term_ids.map { |id| { 'type' => 'term', 'id' => id.to_s } }
                      },
                      image: {
                        data: { 'type' => 'image', 'id' => valid_image.id }
                      }
                    }
                  }
                }

                expect { post items_url, params: payload, as: :jsonapi }.not_to change(Item, :count)

                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

                actual_errors = JSON.parse(response.body)['errors']
                expected_errors = expected_errors_for(valid_attributes, terms: invalid_terms, image: valid_image)
                expected_json = expected_errors.map { |err| jsonapi_for(err) }
                expect(actual_errors).to contain_exactly(*expected_json)
              end
            end

          end
        end
      end

      # TODO: separate PUT and PATCH tests
      describe :update do
        describe 'success' do
          it 'updates an item' do
            item = Item.take

            old_attributes = item.attributes.slice(*Item::EDIT_ATTRS)
            new_attributes = old_attributes.transform_values.with_index { |v, i| (i % 3 == 0) && v.is_a?(String) ? "#{v} (new)" : v }
            expected_attributes = old_attributes.merge(new_attributes)

            expected_terms = item.terms.to_a + [create(:term_abstract), create(:term_pop_art)] - [create(:term_stencil)]

            payload = { data: { type: 'item', id: item.id.to_s, attributes: new_attributes,
                                relationships: to_relationships(terms: expected_terms, image: item.image) } }
            patch item_url(item), params: payload, as: :jsonapi

            expect(response).to have_http_status(:ok)
            expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

            item.reload
            expected_attributes.each { |attr, val| expect(item.send(attr)).to eq(val), "Wrong value for #{attr}" }

            expect(item.terms).to contain_exactly(*expected_terms)

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
            payload = { data: { type: 'item', id: item.id.to_s, attributes: invalid_attributes, relationships: valid_relationships } }

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
            payload = { data: { type: 'item', id: item.id.to_s, attributes: invalid_attributes, relationships: valid_relationships } }

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

          context 'multiple term validation' do
            attr_reader :singular_facets

            before do
              # creating the terms creates the facets by side effect
              create_all(Term)

              @singular_facets = Facet
                .where(allow_multiple: false)
                .where.not(name: 'Concept') # exclude mock facet
                .to_a
              expect(singular_facets.size).to be > 1 # just to be sure
            end

            it 'fails with 422 Unprocessable Entity for multiple term values on singular facets' do
              item = Item.take
              original_updated_at = item.updated_at
              original_terms = item.terms.to_a

              singular_facets.each do |facet|
                terms_added = facet.terms.limit(2)
                expect(terms_added.size).to eq(2) # just to be sure

                invalid_terms = (original_terms + terms_added).uniq

                payload = { data: { type: 'item', attributes: valid_attributes,
                                    relationships: to_relationships(terms: invalid_terms, image: item.image) } }

                expect { patch item_url(item), params: payload, as: :jsonapi }.not_to change(ItemsTerm, :count)

                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)

                actual_errors = JSON.parse(response.body)['errors']
                expected_errors = expected_errors_for(valid_attributes, terms: invalid_terms, image: valid_image, item_to_update: item)
                expected_json = expected_errors.map { |err| jsonapi_for(err) }
                expect(actual_errors).to contain_exactly(*expected_json)

                item.reload
                expect(item.updated_at).to eq(original_updated_at)
                expect(item.terms.pluck(:value)).to contain_exactly(*original_terms.map(&:value))
              end
            end

          end

        end
      end

      describe :destroy do
        describe 'success' do
          it 'deletes an item' do
            item = Item.take
            expect { delete item_url(item), as: :jsonapi }.to change(Item, :count).by(-1)

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
            expect { delete item_url(item), as: :jsonapi }.not_to change(Item, :count)
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
          delete item_url(item), as: :jsonapi

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
          delete item_url(item), as: :jsonapi

          expect(response).to have_http_status(:unauthorized)
          expect(Item.find(item.id)).to eq(item)
        end
      end
    end
  end
end
