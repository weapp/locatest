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

ActiveRecord::Schema.define(version: 2019_03_11_211817) do

  create_table "hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "venue_id"
    t.integer "day"
    t.string "starts_at"
    t.string "ends_at"
    t.index ["venue_id", "day"], name: "index_hours_on_venue_id_and_day", unique: true
    t.index ["venue_id"], name: "index_hours_on_venue_id"
  end

  create_table "venues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "lng"
    t.integer "category_id"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "phone_number"
    t.string "address_line_1"
    t.string "address_line_2"
    t.decimal "lat", precision: 12, scale: 10
    t.decimal "lon", precision: 13, scale: 10
  end

  add_foreign_key "hours", "venues"
end
