# frozen_string_literal: true

module PlatformC
  class Venue < Base::Venue
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

    class << self
      def from_standard(attrs)
        new(name: attrs["name"],
            address_line_1: attrs["address_line_1"],
            address_line_2: attrs["address_line_2"],
            website: attrs["website"],
            phone_number: attrs["phone_number"],
            lat: attrs["lat"],
            lng: attrs["lng"],
            closed: attrs["closed"],
            hours: from_standard_hours(attrs["hours"]))
      end

      def from_standard_hours(hours)
        hours.map { |hsh| "#{hsh['starts_at']}-#{hsh['ends_at']}" }.join(",")
      end
    end
  end
end
