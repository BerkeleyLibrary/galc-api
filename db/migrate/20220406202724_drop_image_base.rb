class DropImageBase < ActiveRecord::Migration[7.0]
  def up
    remove_column(:items, :image_base)
  end

  def down
    add_column(:items, :image_base, :string)
    Item.reset_column_information

    Item.update_all("image_base = REGEXP_REPLACE(image, '\\.jpg$', '', 'i')")
  end
end
