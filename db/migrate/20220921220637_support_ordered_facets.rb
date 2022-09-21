class SupportOrderedFacets < ActiveRecord::Migration[7.0]
  ORDERED_FACETS = %w[
    Size
    Decade
    Genre
    Medium
    Appearance
  ].freeze

  def change
    add_column(:facets, :ord, :integer, default: 0, null: false)
    set_order!
    add_index(:facets, :ord, unique: true)
  end

  private

  def set_order!
    return if Rails.env.test?

    ORDERED_FACETS.each_with_index do |name, index|
      facet = Facet.find_by!(name: name)
      facet.update(ord: index)
    end
  end
end
