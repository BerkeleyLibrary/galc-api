# Ensure migration can run without error even if we delete/rename the models
(class Item < ActiveRecord::Base; end) unless defined?(Item)

class DropImageBase < ActiveRecord::Migration[7.0]
  def up
    remove_column(:items, :image_base)
  end

  def down
    add_column(:items, :image_base, :string)
    Item.update_all("image_base = REGEXP_REPLACE(image, '\\.jpg$', '', 'i')")
  end
end
