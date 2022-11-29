class DropImageAndThumbnailFromItems < ActiveRecord::Migration[7.0]
  def up
    change_table :items do |t|
      t.remove :image, :thumbnail
    end

    Item.reset_column_information
  end

  def down
    change_table :items do |t|
      t.string :image
      t.string :thumbnail
    end

    stmt = <<~SQL.squish
      UPDATE items
         SET image = images.basename,
             thumbnail = images.thumbnail
        FROM images
       WHERE images.id = items.image_id
    SQL
    exec_update(stmt)

    Item.reset_column_information
  end
end
