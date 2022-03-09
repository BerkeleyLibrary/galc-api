class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :image_base
      t.string :title
      t.string :artist
      t.string :artist_url
      t.string :date
      t.string :decade
      t.string :description
      t.string :medium
      t.string :colors
      t.string :genre
      t.string :dimensions
      t.string :size
      t.string :series
      t.string :bib_number
      t.string :mms_id
      t.string :barcode
      t.string :circulation
      t.string :location
      t.string :value
      t.string :appraisal_date
      t.string :notes
      t.date :reserve_date

      t.timestamps
    end
    add_index :items, :bib_number, unique: true
    add_index :items, :mms_id, unique: true
  end
end
