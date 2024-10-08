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

ActiveRecord::Schema[7.0].define(version: 2024_10_05_040024) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_string"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_addresses_on_location_id"
  end

  create_table "humans", force: :cascade do |t|
    t.string "name"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "location_last_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_humans_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.decimal "lat1", precision: 10, scale: 6
    t.decimal "lng1", precision: 10, scale: 6
    t.decimal "lat2", precision: 10, scale: 6
    t.decimal "lng2", precision: 10, scale: 6
    t.decimal "lat3", precision: 10, scale: 6
    t.decimal "lng3", precision: 10, scale: 6
    t.decimal "lat4", precision: 10, scale: 6
    t.decimal "lng4", precision: 10, scale: 6
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
  end

  add_foreign_key "addresses", "locations"
end
