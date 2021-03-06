# A search facet.
class Facet < ApplicationRecord

  # ------------------------------------------------------------
  # Relations

  has_many :terms, dependent: :destroy

  # ------------------------------------------------------------
  # Validations

  validates :name, presence: true
  validates :name, uniqueness: true
end
