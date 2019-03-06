# frozen_string_literal: true

class Venue < ApplicationRecord
  has_many :hours, dependent: :destroy

  def as_json(*)
    super(exclude: "id").tap do |json|
      # sort_by is made by application instead database
      # order(:day) is made by database
      # but sort_by works even with unsaved models, and is better for testing
      # This is affordable for 7 tiny objects
      json["hours"] = hours.sort_by(&:day).map(&:only_hours)
    end
  end
end
