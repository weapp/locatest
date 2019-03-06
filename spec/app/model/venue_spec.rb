# frozen_string_literal: true

require "spec_helper"

describe Venue do
  subject { example_venue }

  it do
    expect(subject.as_json).to include(
      "id" => nil,
      "name" => "Cummings-Lehner",
      "address_line_1" => "93432 Dario Station",
      "address_line_2" => "Apt. 809",
      "category_id" => 4,
      "closed" => false,
      "lat" => "59.1485919774",
      "lng" => "9.6239895111",
      "phone_number" => "+34666999666",
      "website" => "https://localistico.com",
      "hours" => [
        { "starts_at" => "10:00", "ends_at" => "22:00" },
        { "starts_at" => "10:00", "ends_at" => "22:00" },
        { "starts_at" => "10:00", "ends_at" => "22:00" },
        { "starts_at" => "10:00", "ends_at" => "22:00" },
        { "starts_at" => "10:00", "ends_at" => "22:00" },
        { "starts_at" => "11:00", "ends_at" => "18:00" },
        { "starts_at" => "11:00", "ends_at" => "18:00" }
      ]
    )
  end
end
