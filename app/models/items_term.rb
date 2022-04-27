# Explicit model for the items_terms table that implements the
# item <-> term HABTM relation, allowing us to use it directly
# in filtering
class ItemsTerm < ActiveRecord::Base
  belongs_to :term
  belongs_to :item

  # ------------------------------------------------------------
  # Scopes

  scope :for_terms, ->(terms) { where(term_id: terms) }
end
