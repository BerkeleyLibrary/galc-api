class RequireMMSIdForUnsuppressedItems < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :items, '(suppressed = true OR mms_id IS NOT NULL)', name: 'unsuppressed_item_has_mms_id'

  end
end
