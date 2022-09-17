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
      term_planographic = Term.find_by!(value: 'Planographic', facet: facet_medium)
      direct_items = term_planographic.items
      indirect_items = term_planographic.children.flat_map(&:items)
      expected_items = direct_items + indirect_items

      facet_values = { 'Medium' => ['Planographic'] }
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
      items = Item.with_all_keywords('severe')
      expect(items).to exist
      items.each { |i| expect(i.description.downcase).to include('severe') }
    end

    it 'finds items by date' do
      items = Item.with_all_keywords('1957')
      expect(items).to exist
      items.each { |i| expect(i.date).to include('1957') }
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
      let(:base_url) { Rails.application.config.galc_image_base_url }

      describe :image_uri do
        it 'returns the image URI' do
          item = Item.find_by(artist: 'Minami, Keiko')
          escaped_basename = BerkeleyLibrary::Util::URIs.path_escape(item.image)
          expected_uri = BerkeleyLibrary::Util::URIs.append(base_url, escaped_basename)
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
          escaped_basename = BerkeleyLibrary::Util::URIs.path_escape(item.thumbnail)
          expected_uri = BerkeleyLibrary::Util::URIs.append(base_url, escaped_basename)
          expect(item.thumbnail_uri).to eq(expected_uri)
        end

        it 'returns nil for a missing thumbnail' do
          item = Item.find_by(artist: 'Minami, Keiko')
          item.thumbnail = nil
          expect(item.thumbnail_uri).to eq(nil)
        end
      end
    end
  end

end
