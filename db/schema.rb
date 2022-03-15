# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_11_190417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "image"
    t.string "image_base" # TODO: drop this, it's just `image` without the file extension
    t.string "title"
    t.string "artist"
    t.string "artist_url"
    t.string "date"
    t.string "decade"
    t.string "description"
    t.string "medium"
    t.string "colors"
    t.string "genre"
    t.string "dimensions"
    t.string "size"
    t.string "series"
    t.string "bib_number" # TODO: drop this, it's all MMS IDs now
    t.string "mms_id"
    t.string "barcode"
    t.string "circulation"
    t.string "location"
    t.string "value"
    t.string "appraisal_date"
    t.string "notes"
    t.date "reserve_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bib_number"], name: "index_items_on_bib_number", unique: true
    t.index ["mms_id"], name: "index_items_on_mms_id", unique: true
  end

end
