require 'rails_helper'

describe Item do
  before do
    FactoryBot.factories.select { |f| f.build_class == Item }.each { |f| create(f.name) }
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

      results = Item.with_facet_values({ 'Colors' => 'Color', 'Genre' => 'Landscape' })
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

    xit 'handles completely bananas queries' do
      facet_values = {
        'Medium' => %w[Etching Lithograph Intaglio],
        'Genre' => %w[Landscape Figurative],
        'Decade' => ['1990-1999', 'After 1999', '1960-1969', '1950-1959'],
        'Size' => %w[Small Medium]
      }
      results = Item.with_facet_values(facet_values)
      puts(results.to_sql)
      # TODO: test this
    end

    # TODO: support nested materials
  end
end
