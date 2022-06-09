# Ensure migration can run without error even if we delete/rename the models
(class Item < ActiveRecord::Base; end) unless defined?(Item)

class AddThumbnailToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :thumbnail, :string, null: :false

    Item.update_all("thumbnail = REGEXP_REPLACE(image, '(?i)\\.jpg$', '_360px.jpg')")
  end
end
