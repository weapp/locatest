# frozen_string_literal: true

module PlatformB
  class Venue < Base::Venue
    field :id, :integer
    field :name
    field :street_address
    field :lat
    field :lng
    field :category_id, :integer
    field :closed, :bool
    field :hours # , VenueHoursB
    field :created_at
    field :updated_at

    def self.from_standard(attrs)
      new(id: attrs["id"],
          name: attrs["name"],
          street_address: attrs["address_line_1"],
          lat: attrs["lat"],
          lng: attrs["lng"],
          category_id: from_standard_cat_id(attrs["category_id"]),
          closed: attrs["closed"],
          hours: attrs["hours"])
    end

    # This should be moved to yaml or database for production
    def self.from_standard_cat_id(cat_id)
      cat_id + 2000
    end
  end
end
