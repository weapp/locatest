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
    # t.string :hours # , VenueHoursLocaltest
  end
end
