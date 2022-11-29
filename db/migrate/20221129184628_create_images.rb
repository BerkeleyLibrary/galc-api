class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :basename
      t.string :thumbnail

      t.timestamps
    end
  end
end
