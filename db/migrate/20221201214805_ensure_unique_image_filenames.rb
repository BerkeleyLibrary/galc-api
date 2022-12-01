class EnsureUniqueImageFilenames < ActiveRecord::Migration[7.0]
  def change
    add_index :images, :basename, unique: true
    add_index :images, :thumbnail, unique: true
  end
end
