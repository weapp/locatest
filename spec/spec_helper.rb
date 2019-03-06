# frozen_string_literal: true

require "simplecov"
SimpleCov.start

ENV["APP_ENV"] ||= "test"
require ::File.expand_path("../../app", __FILE__)


def example_venue
  Venue.new(
    name: "Cummings-Lehner",
    lat: "59.1485919774",
    lng: "9.6239895111",
    category_id: 4,
    closed: false,
    website: "https://localistico.com",
    phone_number: "+34666999666",
    address_line_1: "93432 Dario Station",
    address_line_2: "Apt. 809",
  )
end
