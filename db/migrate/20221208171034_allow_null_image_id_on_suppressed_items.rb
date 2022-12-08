class AllowNullImageIdOnSuppressedItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :image_id, true
    add_check_constraint :items, '(suppressed = true OR image_id IS NOT NULL)', name: 'unsuppressed_item_has_image'
  end
end
