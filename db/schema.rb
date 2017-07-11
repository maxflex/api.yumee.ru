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

ActiveRecord::Schema.define(version: 20170711120948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "building"
    t.string "corpus"
    t.string "stroenie"
    t.string "flat"
    t.string "lat"
    t.string "lng"
    t.bigint "city_id", default: 1
    t.integer "floor"
    t.string "domofon"
    t.string "comment"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "logo"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "preferences", default: [1, 2, 3, 4, 5], array: true
    t.bigint "address_id"
    t.bigint "plan_id"
    t.integer "age"
    t.integer "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["plan_id"], name: "index_users_on_plan_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "plans"
end
