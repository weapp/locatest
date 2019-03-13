# frozen_string_literal: true

module RSpec
  module PlatformCHelpers
    def platform_c_success_response
      '{
        "id": 5,
        "name": "Cummings-Lehner",
        "address_line_1": "93432 Dario Station",
        "address_line_2": "Apt. 809",
        "website": "https://localistico.com",
        "phone_number": "+34666999666",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "closed": false,
        "hours": "10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00",
        "created_at": "2019-03-04T17:09:00.657Z",
        "updated_at": "2019-03-04T17:09:00.657Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }'
    end
  end
end
