class Item < ApplicationRecord

  # ------------------------------------------------------------
  # Constants

  ALL_ATTRS = Item.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - [:id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at] + [:terms]).freeze

  # ------------------------------------------------------------
  # Relations

  has_and_belongs_to_many :terms

  # ------------------------------------------------------------
  # Validations

  validates :mms_id, uniqueness: { allow_nil: true }
  validates :title, presence: true # TODO: enforce this in the schema

  # TODO: figure out when we can enforce this
  # validates :image, presence: true
  # validates :artist, presence: true

  # ------------------------------------------------------------
  # Scopes

  # Returns items matching the specified facet values.
  scope :with_facet_values, ->(facet_values) do
    return Item.all if facet_values.empty?

    facet_value_conditions = facet_values.each_with_object([]) do |(facet, terms), conds|
      next if (tt = Array(terms)).empty?

      conds << sanitize_sql(['(facets.name = ? AND terms.value IN (?))', facet, tt])
    end

    # TODO: create a materialized view or something
    item_ids_stmt = <<~SQL.squish
      SELECT items_terms.item_id
        FROM items_terms,
             terms,
             facets
       WHERE items_terms.term_id = terms.id
         AND terms.facet_id = facets.id
         AND (#{facet_value_conditions.join(' OR ')})
       GROUP BY items_terms.item_id
      HAVING COUNT(DISTINCT facets.id) = #{facet_values.size}
    SQL

    where("id IN (#{item_ids_stmt})")
  end
end
