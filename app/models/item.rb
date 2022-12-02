require 'berkeley_library/alma'

class Item < ApplicationRecord
  include PgSearch::Model

  # ------------------------------------------------------------
  # Constants

  ALL_ATTRS = Item.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - %i[id image_id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at] + %i[terms image]).freeze
  SYNTH_ATTRS = %i[permalink_uri].freeze
  JSONAPI_ATTRS = (DATA_ATTRS + SYNTH_ATTRS).freeze

  # ------------------------------------------------------------
  # Relations

  has_and_belongs_to_many :terms
  belongs_to :image

  # ------------------------------------------------------------
  # Validations

  validates :mms_id, uniqueness: { allow_nil: true }
  validates :title, presence: true # TODO: enforce this in the schema
  validate :multiple_terms_allowed

  def multiple_terms_allowed
    terms_by_facet = terms.group_by(&:facet)
    terms_by_facet.each do |facet, terms|
      next if facet.allow_multiple
      next if terms.size < 2

      errors.add(:terms, "multiple values for #{facet.name}: #{terms.map(&:value).join(', ')}")
    end
  end

  # ------------------------------------------------------------
  # Scopes

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

  def size
    return unless (size_facet = Facet.find_by(name: 'Size'))
    return unless (size_term = terms.find_by(facet: size_facet))

    size_term.value
  end

  def image_uri
    return unless image

    image.relative_uri
  end

  def thumbnail_uri
    return unless image

    image.thumbnail_relative_uri
  end
end
