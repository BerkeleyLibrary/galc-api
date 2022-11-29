class LinkItemsToImages < ActiveRecord::Migration[7.0]
  def change
    change_table :items do |t|
      t.references :image, null: true, foreign_key: true
    end

    stmt = <<~SQL.squish
      UPDATE items
         SET image_id = images.id
        FROM images
       WHERE images.basename = items.image
         AND images.thumbnail = items.thumbnail
    SQL
    exec_update(stmt)

    change_column_null :items, :image_id, false

    Item.reset_column_information
  end
end
