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

  default_scope { order(:artist, :title) }

  # Returns items matching the specified facet values.
  scope :with_facet_values, ->(facet_values) do
    return Item.all if facet_values.empty?

    facet_value_conditions = facet_values.each_with_object([]) do |(facet, terms), conds|
      next if (tt = Array(terms)).empty?

      conds << sanitize_sql(['(facet_name = ? AND term_value IN (?))', facet, tt])
    end

    item_ids_stmt = <<~SQL.squish
      SELECT DISTINCT item_id
        FROM facet_lookup
       WHERE (#{facet_value_conditions.join(' OR ')})
       GROUP BY item_id
      HAVING COUNT(DISTINCT facet_name) = #{facet_values.size}
    SQL

    where("id IN (#{item_ids_stmt})")
  end
end
