class AddThumbnailToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :thumbnail, :string, null: :false
    Item.reset_column_information

    Item.update_all("thumbnail = REGEXP_REPLACE(image, '(?i)\\.jpg$', '_360px.jpg')")
  end
end
