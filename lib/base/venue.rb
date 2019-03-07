# frozen_string_literal: true

require "foxy/model"

module Base
  class Venue < Foxy::Model
    def as_json(*)
      super.except("created_at", "updated_at")
    end

    def undefined_str
      "<not available>"
    end

    def undefined_int
      -1
    end
  end
end
