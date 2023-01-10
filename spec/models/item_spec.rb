require 'rails_helper'

describe Item do
  before do
    create_all(Item)
  end

  describe :with_facet_values do
    it 'finds items based on a single facet value' do
      term_woodcut = create(:term_woodcut)
      expected_items = term_woodcut.items
      expect(expected_items).not_to be_empty # just to be sure

      results = Item.with_facet_values({ 'Medium' => 'Woodcut' })
      expect(results).to contain_exactly(*expected_items)
    end

    it 'finds items based on ORing values for a single facet' do
      term_etching = create(:term_etching)
      term_lithograph = create(:term_lithograph)
      expected_items = term_etching.items + term_lithograph.items
      expect(expected_items).not_to be_empty # just to be sure

      results = Item.with_facet_values({ 'Medium' => %w[Etching Lithograph] })
      expect(results).to contain_exactly(*expected_items)
    end

    it 'finds items based on ANDing values for multiple facets' do
      term_color = create(:term_color)
      term_landscape = create(:term_landscape)
      expected_items = term_color.items & term_landscape.items
      expect(expected_items).not_to be_empty # just to be sure

      results = Item.with_facet_values({ 'Appearance' => 'Color', 'Genre' => 'Landscape' })
      expect(results).to contain_exactly(*expected_items)
    end

    it 'finds items based on ANDing multiple OR values for multiple facets' do
      term_etching = create(:term_etching)
      term_lithograph = create(:term_lithograph)
      items_by_medium = (term_etching.items + term_lithograph.items)

      term_landscape = create(:term_landscape)
      term_figurative = create(:term_figurative)
      items_by_genre = (term_landscape.items + term_figurative.items)

      expected_items = items_by_medium & items_by_genre
      expect(expected_items).not_to be_empty # just to be sure

      facet_values = { 'Medium' => %w[Etching Lithograph], 'Genre' => %w[Landscape Figurative] }
      results = Item.with_facet_values(facet_values)
      expect(results).to contain_exactly(*expected_items)
    end

    it 'handles completely bananas queries' do
      # Make sure we have all the terms
      create_all(Term)

      facet_values = {
        'Medium' => %w[Etching Lithograph Intaglio],
        'Genre' => %w[Landscape Figurative],
        'Decade' => ['1990-1999', 'After 1999', '1960-1969', '1950-1959'],
        'Size' => %w[Small Medium]
      }

      facet_items = facet_values.map do |f_name, t_values|
        facet = Facet.find_by!(name: f_name)
        t_values.flat_map do |t_value|
          term = Term.find_by!(facet: facet, value: t_value)
          term.items
        end.uniq
      end

      expected_items = facet_items.inject do |items, f_items|
        items & f_items
      end

      results = Item.with_facet_values(facet_values)
      expect(results).to contain_exactly(*expected_items)
    end

    it 'finds items based on implicit parent material values' do
      facet_medium = Facet.find_by!(name: 'Medium')
      term_relief = Term.find_by!(value: 'Relief', facet: facet_medium)
      direct_items = term_relief.items
      indirect_items = term_relief.children.flat_map(&:items)
      expected_items = direct_items + indirect_items

      facet_values = { 'Medium' => ['Relief'] }
      results = Item.with_facet_values(facet_values)
      expect(results).to contain_exactly(*expected_items)
    end
  end

  describe :with_all_keywords do
    it 'finds items by title' do
      items = Item.with_all_keywords('arbre')
      expect(items).to exist
      items.each { |i| expect(i.title.downcase).to include('arbre') }
    end

    it 'finds items by artist' do
      items = Item.with_all_keywords('keiko')
      expect(items).to exist
      items.each { |i| expect(i.artist.downcase).to include('keiko') }
    end

    it 'finds items by description' do
      items = Item.with_all_keywords('signed')
      expect(items).to exist
      items.each { |i| expect(i.description.downcase).to include('signed') }
    end

    it 'finds items by date' do
      items = Item.with_all_keywords('1955')
      expect(items).to exist
      items.each { |i| expect(i.date).to include('1955') }
    end

    it 'finds items by term values' do
      items = Item.with_all_keywords('medium')
      expect(items).to exist
      items.each do |item|
        term_values = item.terms.pluck(:value)
        expect(term_values.map(&:downcase)).to include('medium')
      end
    end

    it 'finds items by combinations of fields and term values' do
      expected_item = Item.find_by(artist: 'Minami, Keiko')

      items = Item.with_all_keywords('color medium numbered minami')
      expect(items).to exist
      expect(items).to contain_exactly(expected_item)
    end
  end

  describe 'validations' do
    it 'requires an image for unsuppressed items' do
      item = Item.take
      img_before = item.image
      updated_at_before = item.updated_at

      item.image = nil
      expect(item).not_to be_valid

      errors = item.errors
      expect(errors.size).to eq(1)
      error = errors.first
      expect(error.attribute).to eq(:image)

      expect { item.save! }.to raise_error(ActiveRecord::RecordInvalid)
      item.reload
      expect(item.updated_at).to eq(updated_at_before)
      expect(item.image).to eq(img_before)
    end

    it 'allows a nil image for suppressed items' do
      item = Item.take
      item.suppressed = true
      item.image = nil
      expect(item).to be_valid

      item.save!
      item.reload
      expect(item.suppressed).to eq(true)
      expect(item.image).to be_nil
    end

    it 'requires an mms_id for unsuppressed items' do
      item = Item.take
      img_before = item.mms_id
      updated_at_before = item.updated_at

      item.mms_id = nil
      expect(item).not_to be_valid

      errors = item.errors
      expect(errors.size).to eq(1)
      error = errors.first
      expect(error.attribute).to eq(:mms_id)

      expect { item.save! }.to raise_error(ActiveRecord::RecordInvalid)
      item.reload
      expect(item.updated_at).to eq(updated_at_before)
      expect(item.mms_id).to eq(img_before)
    end

    it 'allows a nil mms_id for suppressed items' do
      item = Item.take
      item.suppressed = true
      item.mms_id = nil
      expect(item).to be_valid

      item.save!
      item.reload
      expect(item.suppressed).to eq(true)
      expect(item.mms_id).to be_nil
    end

    it 'does not allow an empty mms_id even for suppressed items' do
      item = Item.take
      mms_id_before = item.mms_id
      updated_at_before = item.updated_at

      item.suppressed = true
      item.mms_id = ''
      expect(item).not_to be_valid

      expect { item.save! }.to raise_error(ActiveRecord::RecordInvalid)
      item.reload
      expect(item.updated_at).to eq(updated_at_before)
      expect(item.mms_id).to eq(mms_id_before)
    end

    it 'does not allow a blank, non-empty mms_id even for suppressed items' do
      item = Item.take
      mms_id_before = item.mms_id
      updated_at_before = item.updated_at

      item.suppressed = true
      item.mms_id = ' '
      expect(item).not_to be_valid

      expect { item.save! }.to raise_error(ActiveRecord::RecordInvalid)
      item.reload
      expect(item.updated_at).to eq(updated_at_before)
      expect(item.mms_id).to eq(mms_id_before)
    end

    it 'allows multiple suppressed items with nil mms_id' do
      aggregate_failures do
        (0..1).each do |i|
          title = "item #{i}"
          item = Item.create!(title: title, suppressed: true)
          expect(item).to be_persisted
          item.reload
          expect(item.mms_id).to be_nil
          expect(item.title).to eq(title)
          expect(item.suppressed).to eq(true)
        end
      end
    end
  end

  describe 'synthetic accessors' do
    describe :record_id do
      it 'returns a RecordId if MMS ID is present' do
        mms_id = '991078545009706532'
        expected_id = BerkeleyLibrary::Alma::RecordId.parse(mms_id)

        item = Item.find_by!(mms_id: mms_id)
        expect(item.record_id).to eq(expected_id)
      end

      it 'returns nil if MMS ID is not present' do
        item = Item.find_by(mms_id: nil) || create(:nil_mms_id)
        expect(item.record_id).to be_nil
      end
    end

    describe :permalink_uri do
      it 'returns the permalink URI' do
        mms_id = '991078545009706532'
        expected_uri = BerkeleyLibrary::Alma::RecordId.parse(mms_id).permalink_uri

        item = Item.find_by!(mms_id: mms_id)
        expect(item.permalink_uri).to eq(expected_uri)
      end
    end

    describe :size do
      it 'returns the size value' do
        item = Item.find_by!(mms_id: '991078545009706532')
        expect(item.size).to eq('Small')
      end
    end

    describe 'image URIs' do
      describe :image_uri do
        it 'returns the image URI' do
          item = Item.find_by(artist: 'Minami, Keiko')
          expected_uri = item.image.relative_uri
          expect(item.image_uri).to eq(expected_uri)
        end

        it 'returns nil for a missing image' do
          item = Item.find_by(artist: 'Minami, Keiko')
          item.image = nil
          expect(item.image_uri).to eq(nil)
        end
      end

      describe :thumbnail_uri do
        it 'returns the thumbnail URI' do
          item = Item.find_by(artist: 'Minami, Keiko')
          expected_uri = item.image.thumbnail_relative_uri
          expect(item.thumbnail_uri).to eq(expected_uri)
        end

        it 'returns nil for a missing thumbnail' do
          item = Item.find_by(artist: 'Minami, Keiko')
          item.image = nil
          expect(item.thumbnail_uri).to eq(nil)
        end
      end
    end
  end

end
