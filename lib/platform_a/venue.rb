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
    field :api_key
  end
end
