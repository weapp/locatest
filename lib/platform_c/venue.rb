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
    field :api_key
  end
end
