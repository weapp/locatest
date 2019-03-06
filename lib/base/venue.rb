# frozen_string_literal: true

require "foxy/model"

module Base
  class Venue < Foxy::Model
    def as_json(*)
      super.except("created_at", "updated_at")
    end
  end
end
