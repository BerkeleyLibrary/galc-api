class PopulateImages < ActiveRecord::Migration[7.0]
  def up
    stmt = <<~SQL.squish
      INSERT INTO images (basename, thumbnail, created_at, updated_at)
           SELECT image, thumbnail, now(), now()
             FROM items
         ORDER BY 1
    SQL
    exec_insert(stmt)
  end

  def down
    exec_delete('DELETE FROM images')
    ActiveRecord::Base.connection.reset_pk_sequence!('images', :id, 'images_id_seq')
  end
end
