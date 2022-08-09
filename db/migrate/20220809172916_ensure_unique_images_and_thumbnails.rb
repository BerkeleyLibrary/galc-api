class EnsureUniqueImagesAndThumbnails < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :image, unique: true
    add_index :items, :thumbnail, unique: true
  end
end
