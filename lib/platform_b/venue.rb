# frozen_string_literal: true

module PlatformB
  class Venue < Base::Venue
    DAYS = %w[Mon Tue Wed Thu Fri Sat Sun].freeze

    field :name
    field :street_address
    field :lat
    field :lng
    field :category_id, :integer
    field :closed, :bool
    field :hours # , VenueHoursB
    field :created_at
    field :updated_at

    class << self
      def from_standard(attrs)
        new(name: attrs["name"],
            street_address: attrs["address_line_1"],
            lat: attrs["lat"],
            lng: attrs["lng"],
            category_id: from_standard_cat_id(attrs["category_id"]),
            closed: attrs["closed"],
            hours: from_standard_hours(attrs["hours"]))
      end

      def from_standard_hours(hours)
        hours.each_with_index.map do |hsh, i|
          "#{DAYS[i]}:#{hsh['starts_at']}-#{hsh['ends_at']}"
        end.join("|")
      end

      # This should be moved to yaml or database for production
      def from_standard_cat_id(cat_id)
        cat_id + 2000
      end
    end
  end
end
