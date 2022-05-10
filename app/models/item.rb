require 'berkeley_library/alma'

class Item < ApplicationRecord
  include PgSearch::Model

  # ------------------------------------------------------------
  # Constants

  ALL_ATTRS = Item.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - [:id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at] + [:terms]).freeze
  SYNTH_ATTRS = [:permalink_uri].freeze
  JSONAPI_ATTRS = (DATA_ATTRS + SYNTH_ATTRS).freeze

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

  # TODO: add sorting to API
  # TODO: allow sorting by facet values
  default_scope { order(:artist, :title, :date) }

  pg_search_scope(
    :with_all_keywords,
    against: { title: 'A', artist: 'B', description: 'C', date: 'D' },
    associated_against: { terms: :value },
    using: {
      tsearch: { prefix: true }
    }
  )

  scope :for_terms, ->(terms) do
    item_ids = ItemsTerm.for_terms(terms).select(:item_id)
    Item.where(id: item_ids)
  end

  # Returns items matching the specified facet values.
  scope :with_facet_values, ->(values_by_facet) do
    return Item.all if values_by_facet.empty?

    items_for_facets = Term
      .grouped_by_facet(values_by_facet)
      .map { |terms| Item.for_terms(terms) }

    items_for_facets
      .inject { |facet_items, all_items| all_items.and(facet_items) }
  end

  # ------------------------------------------------------------
  # Synthetic attributes

  def record_id
    mms_id && BerkeleyLibrary::Alma::RecordId.parse(mms_id)
  end

  def permalink_uri
    record_id.respond_to?(:permalink_uri) && record_id.permalink_uri
  end
end
