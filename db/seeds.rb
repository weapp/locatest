Venue.destroy_all

Venue.create(
  name: "Cummings-Lehner",
  lat: "59.1485919774",
  lng: "9.6239895111",
  category_id: 4,
  closed: false,
  website: "https://localistico.com",
  phone_number: "+34666999666",
  address_line_1: "93432 Dario Station",
  address_line_2: "Apt. 809",
  hours: [
    Hour.new(day: 0, starts_at: "10:00", ends_at: "22:00"),
    Hour.new(day: 1, starts_at: "10:00", ends_at: "22:00"),
    Hour.new(day: 2, starts_at: "10:00", ends_at: "22:00"),
    Hour.new(day: 3, starts_at: "10:00", ends_at: "22:00"),
    Hour.new(day: 4, starts_at: "10:00", ends_at: "22:00"),
    Hour.new(day: 5, starts_at: "11:00", ends_at: "18:00"),
    Hour.new(day: 6, starts_at: "11:00", ends_at: "18:00")
  ]
)
