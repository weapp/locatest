# frozen_string_literal: true

module RSpec
  module PlatformAHelpers
    def platform_a_success_response
      '{
        "id": 5,
        "name": "Cummings-Lehner",
        "address": "93432 Dario Station",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "category_id": 1004,
        "closed": true,
        "hours": "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00",
        "created_at": "2019-03-04T17:09:00.605Z",
        "updated_at": "2019-03-04T17:09:00.605Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }'
    end
  end
end
