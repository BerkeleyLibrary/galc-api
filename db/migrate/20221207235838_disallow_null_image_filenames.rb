class DisallowNullImageFilenames < ActiveRecord::Migration[7.0]
  def change
    change_column_null :images, :basename, false
    change_column_null :images, :thumbnail, false
  end
end
