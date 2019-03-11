# frozen_string_literal: true

module RSpec
  module PlatformBHelpers
    def platform_b_success_response
      '{
        "id": 5,
        "name": "Cummings-Lehner",
        "street_address": "93432 Dario Station",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "category_id": 2004,
        "closed": false,
        "hours": "Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00",
        "created_at": "2019-03-04T17:09:00.640Z",
        "updated_at": "2019-03-04T17:09:00.640Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }'
    end
  end
end
