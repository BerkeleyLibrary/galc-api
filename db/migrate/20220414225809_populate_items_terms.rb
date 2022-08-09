class PopulateItemsTerms < ActiveRecord::Migration[7.0]
  def up
    facets = Facet.eager_load(:terms).to_a
    Item.find_each do |item|
      item_terms = []
      facets.each do |facet|
        facet_attr = facet.name.downcase
        next unless (facet_val = item[facet_attr])

        facet_term_vals = facet_val.split(',').map(&:strip)
        facet_terms = facet_term_vals.map { |v| Term.find_by(facet: facet, value: v) }
        item_terms.concat(facet_terms)
      end
      item.terms = item_terms
    end
  end

  def down
    Term.find_each { |term| term.items.clear }
  end
end
