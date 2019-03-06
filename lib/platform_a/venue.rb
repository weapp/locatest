# frozen_string_literal: true

module PlatformA
  class Venue < Base::Venue
    field :id, :integer
    field :name
    field :address
    field :lat
    field :lng
    field :category_id, :integer
    field :closed, :bool
    field :hours # , VenueHoursA
    field :created_at
    field :updated_at

    def self.from_standard(attrs)
      new(id: attrs["id"],
          name: attrs["name"],
          address: attrs["address_line_1"],
          lat: attrs["lat"],
          lng: attrs["lng"],
          category_id: from_standard_cat_id(attrs["category_id"]),
          closed: attrs["closed"],
          hours: attrs["hours"])
    end

    # This should be moved to yaml or database for production
    def self.from_standard_cat_id(cat_id)
      cat_id + 1000
    end
  end
end
