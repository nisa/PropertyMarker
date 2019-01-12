# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_12_114827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "state"
    t.integer "postcode"
    t.string "full_address"
    t.bigint "property_id"
    t.bigint "feature_id"
    t.bigint "lga_id"
    t.index ["feature_id"], name: "index_addresses_on_feature_id"
    t.index ["lga_id"], name: "index_addresses_on_lga_id"
    t.index ["property_id"], name: "index_addresses_on_property_id"
  end

  create_table "features", force: :cascade do |t|
  end

  create_table "lgas", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "long_name"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "council_property_number"
    t.decimal "longitude"
    t.decimal "latitude"
    t.bigint "lga_id"
    t.index ["lga_id"], name: "index_properties_on_lga_id"
  end

end
