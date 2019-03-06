ActiveRecord::Schema.define do
  create_table "venues", force: true do |t|
    t.string "name"
    t.string "lat"
    t.string "lng"
    t.integer "category_id"
    t.boolean "closed"
    t.string "created_at"
    t.string "updated_at"
    t.string "website"
    t.string "phone_number"
    t.string "address_line_1"
    t.string "address_line_2"
    t.timestamps null: false
  end

  create_table "hours", force: true do |t|
    t.references "venue", index: true, foreign_key: {on_delete: :cascade}
    t.integer "day"
    t.string "starts_at"
    t.string "ends_at"

    t.index ["venue", "day"], unique: true
  end
end
