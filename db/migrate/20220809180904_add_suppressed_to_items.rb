class AddSuppressedToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :suppressed, :boolean, default: false, null: false
  end
end
