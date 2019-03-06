# frozen_string_literal: true

class Hour < ApplicationRecord
  def only_hours
    as_json(only: %w[starts_at ends_at])
  end
end
