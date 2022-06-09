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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_204903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facets_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "artist"
    t.string "artist_url"
    t.string "date"
    t.string "description"
    t.string "dimensions"
    t.string "series"
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
    t.string "thumbnail"
    t.index ["mms_id"], name: "index_items_on_mms_id", unique: true
  end

  create_table "items_terms", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "term_id", null: false
    t.index ["item_id", "term_id"], name: "index_items_terms_on_item_id_and_term_id", unique: true
    t.index ["term_id", "item_id"], name: "index_items_terms_on_term_id_and_item_id", unique: true
  end

  create_table "terms", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "facet_id", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facet_id"], name: "index_terms_on_facet_id"
    t.index ["parent_id"], name: "index_terms_on_parent_id"
    t.index ["value"], name: "index_terms_on_value", unique: true
  end

  add_foreign_key "items_terms", "items"
  add_foreign_key "items_terms", "terms"
  add_foreign_key "terms", "facets"
  add_foreign_key "terms", "terms", column: "parent_id"
end
