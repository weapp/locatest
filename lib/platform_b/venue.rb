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
    field :api_key
  end
end
