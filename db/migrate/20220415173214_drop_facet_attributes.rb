class DropFacetAttributes < ActiveRecord::Migration[7.0]
  def up
    remove_columns :items, :colors, :size, :decade, :genre, :medium
  end

  def down
    add_column :items, :colors, :string
    add_column :items, :size, :string
    add_column :items, :decade, :string
    add_column :items, :genre, :string
    add_column :items, :medium, :string
    Item.reset_column_information

    facets_by_id = Facet.eager_load(:terms).each_with_object({}) do |f, ff|
      ff[f.id] = f
    end

    Item.eager_load(:terms).find_each do |item|
      term_vals_by_facet = item.terms.each_with_object({}) do |t, tv|
        facet = facets_by_id[t.facet_id]
        (tv[facet] ||= []) << t.value
      end
      next if term_vals_by_facet.empty?

      item_attrs = term_vals_by_facet.each_with_object({}) do |(f, tv), attrs|
        attr_name = f.name.downcase.to_sym
        attrs[attr_name] = tv.join(', ')
      end

      item.update!(**item_attrs)
    end
  end
end
