# A search facet.
class Facet < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
