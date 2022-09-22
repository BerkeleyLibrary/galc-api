class SupportOrderedFacets < ActiveRecord::Migration[7.0]
  ORDERED_FACETS = %w[
    Size
    Decade
    Genre
    Medium
    Appearance
  ].freeze

  def up
    add_column(:facets, :ord, :integer, default: 0, null: false)
    Facet.reset_column_information

    set_order!
    add_index(:facets, :ord, unique: true)
  end

  def down
    remove_column(:facets, :ord)
  end

  private

  def set_order!
    ORDERED_FACETS.each_with_index do |name, ord|
      sql = 'UPDATE facets SET ord = :ord WHERE name = :name'
      stmt = ActiveRecord::Base.sanitize_sql([sql, { ord: ord, name: name }])
      exec_update(stmt)
    end
  end
end
