# frozen_string_literal: true

module PlatformA
  class Venue < Base::Venue
    field :name
    field :address
    field :lat
    field :lng
    field :category_id, :integer
    field :closed, :bool
    field :hours # , VenueHoursA
    field :created_at
    field :updated_at

    class << self
      def from_standard(attrs)
        new(name: attrs["name"],
            address: attrs["address_line_1"],
            lat: attrs["lat"],
            lng: attrs["lng"],
            category_id: from_standard_cat_id(attrs["category_id"]),
            closed: attrs["closed"],
            hours: from_standard_hours(attrs["hours"]))
      end

      def from_standard_hours(hours)
        hours.map { |hsh| "#{hsh['starts_at']}-#{hsh['ends_at']}" }.join("|")
      end

      # This should be moved to yaml or database for production
      def from_standard_cat_id(cat_id)
        cat_id + 1000
      end
    end
  end
end
