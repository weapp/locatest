# frozen_string_literal: true

module PlatformC
  class Venue < Base::Venue
    field :id, :integer
    field :name
    field :address_line_1
    field :address_line_2
    field :website
    field :phone_number
    field :lat
    field :lng
    field :closed, :bool
    field :hours # , VenueHoursC
    field :created_at
    field :updated_at

    def self.from_standard(attrs)
      new(id: attrs["id"],
          name: attrs["name"],
          address_line_1: attrs["address_line_1"],
          address_line_2: attrs["address_line_2"],
          website: attrs["website"],
          phone_number: attrs["phone_number"],
          lat: attrs["lat"],
          lng: attrs["lng"],
          closed: attrs["closed"],
          hours: attrs["hours"])
    end
  end
end
