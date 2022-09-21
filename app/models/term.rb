# A controlled vocabulary term.
class Term < ApplicationRecord

  # ------------------------------------------------------------
  # Relations

  has_many :children, class_name: 'Term', foreign_key: :parent_id, inverse_of: :parent, dependent: :destroy
  belongs_to :parent, class_name: 'Term', optional: true
  has_and_belongs_to_many :items
  belongs_to :facet

  # ------------------------------------------------------------
  # Validations

  validates :value, presence: true
  validates :value, uniqueness: true
  validate :parent_is_same_facet

  # ------------------------------------------------------------
  # Scopes

  default_scope { order(:facet_id, :parent_id, :ord, :value) }

  scope :find_by_self_or_parent, ->(**conditions) {
    sql = <<~SQL.squish
      INNER JOIN (#{Term.where(**conditions).to_sql})#{' '}
              AS direct
              ON (terms.id = direct.id OR terms.parent_id = direct.id)
    SQL

    Term.joins(sql)
  }

  class << self
    # Given a hash from facet names to desired values for that facet,
    # returns an array of ActiveRecord queries corresponding to the
    # provided facet name / term value combinations.
    #
    # Note that term values are compared against the parent as well
    # as the term itself.
    #
    # @param values_by_facet Hash<String, Array<String>> a hash from
    #   facet names to the desired values for that facet
    # @return Array<ActiveRecord::Relation> the query for each facet
    # and corresponding values
    def grouped_by_facet(values_by_facet)
      return [] if values_by_facet.empty?

      all_facet_names = values_by_facet.keys
      all_facets = Facet.where(name: all_facet_names)
      facets_by_name = all_facets.index_by(&:name)

      values_by_facet.filter_map do |f_name, values|
        next unless (facet = facets_by_name[f_name])

        Term.find_by_self_or_parent(facet: facet, value: values)
      end
    end
  end

  # ------------------------------------------------------------
  # Private methods

  private

  # ------------------------------
  # Validators

  def parent_is_same_facet
    return if parent.nil? || facet == parent.facet

    errors.add(:parent, "must be a #{facet.name}")
  end
end
