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

ActiveRecord::Schema.define(version: 20161207110417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "damage_id"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "provider_id"
    t.string   "am_pm"
    t.text     "comment"
    t.index ["damage_id"], name: "index_bookings_on_damage_id", using: :btree
    t.index ["provider_id"], name: "index_bookings_on_provider_id", using: :btree
  end

  create_table "damages", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "category"
    t.boolean  "civil_responsability"
    t.string   "responsability"
    t.boolean  "breaking"
    t.string   "value_thief"
    t.string   "cat_water_damage"
    t.text     "comment"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["place_id"], name: "index_damages_on_place_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "category"
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "superficy"
    t.string   "heating_type"
    t.string   "building_type"
    t.string   "kitchen_type"
    t.integer  "water_room"
    t.string   "floor"
    t.string   "status"
    t.boolean  "chimney"
    t.string   "trustee_reference"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.boolean  "already_insured"
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.string   "category"
    t.string   "company"
    t.string   "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zip_code"
    t.string   "city"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "price"
    t.integer  "covered_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "start_date"
    t.boolean  "home_insurance"
    t.string   "rib"
    t.index ["place_id"], name: "index_quotes_on_place_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.string   "situation"
    t.date     "birth_date"
    t.string   "nb_children"
    t.string   "job"
    t.boolean  "insured",                default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "damages"
  add_foreign_key "damages", "places"
  add_foreign_key "places", "users"
  add_foreign_key "quotes", "places"
end
