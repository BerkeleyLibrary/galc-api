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
  # Private methods

  private

  # ------------------------------
  # Validators

  def parent_is_same_facet
    return if parent.nil? || facet == parent.facet

    errors.add(:parent, "must be a #{facet.name}")
  end
end
