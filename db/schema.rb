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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_200511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "applications", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "prospect_id", null: false
    t.datetime "application_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["property_id"], name: "index_applications_on_property_id"
    t.index ["prospect_id"], name: "index_applications_on_prospect_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.date "dob"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.boolean "is_business", default: false
    t.string "country"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "properties", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.string "province"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.boolean "is_apartment"
    t.string "building_name"
    t.string "tower_number"
    t.string "unit_number"
    t.money "rent_price", scale: 2
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_properties_on_latitude_and_longitude"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
    t.index ["rent_price"], name: "index_properties_on_rent_price"
  end

  create_table "property_images", force: :cascade do |t|
    t.string "image"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_images_on_property_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.date "dob"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.string "province"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "applications", "properties"
  add_foreign_key "applications", "prospects"
  add_foreign_key "properties", "owners"
  add_foreign_key "property_images", "properties"
end
