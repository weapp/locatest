# frozen_string_literal: true

module PlatformA
  class Venue < Base::Venue
    field :name
    field :address
    field :lat, BigDecimal
    field :lng, BigDecimal
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

      private

      def from_standard_hours(hours)
        return nil unless hours.present?

        hours.map { |hsh| "#{hsh['starts_at']}-#{hsh['ends_at']}" }.join("|")
      end

      # This should be moved to yaml or database for production
      def from_standard_cat_id(cat_id)
        cat_id + 1000
      end
    end

    def to_standard
      {
        "name" => name,
        "address_line_1" => address,
        "address_line_2" => undefined_str,
        "lat" => lat,
        "lng" => lng,
        "category_id" => to_standard_cat_id(category_id),
        "closed" => closed,
        "hours" => to_standard_hours(hours),
        "website" => undefined_str,
        "phone_number" => undefined_str
      }
    end

    private

    # This should be moved to yaml or database for production
    def to_standard_cat_id(category_id)
      category_id - 1000
    end

    def to_standard_hours(hours)
      return [] unless hours.present?

      hours.split("|").map do |data|
        starts_at, ends_at = data.split("-")
        { "starts_at" => starts_at, "ends_at" => ends_at }
      end
    end
  end
end
