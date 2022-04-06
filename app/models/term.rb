# A controlled vocabulary term.
class Term < ApplicationRecord
  belongs_to :facet
  has_many :children, class_name: 'Term', foreign_key: :parent_id, inverse_of: :parent, dependent: :destroy
  belongs_to :parent, class_name: 'Term', optional: true

  validates :value, presence: true
  validates :value, uniqueness: true
  validate :parent_is_same_facet

  private

  def parent_is_same_facet
    return if parent.nil? || facet == parent.facet

    errors.add(:parent, "must be a #{facet.name}")
  end
end
