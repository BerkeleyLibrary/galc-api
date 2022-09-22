class AddSuppressedToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :suppressed, :boolean, default: false, null: false
    Item.reset_column_information
  end
end
