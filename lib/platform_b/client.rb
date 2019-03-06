# frozen_string_literal: true

module PlatformB
  class Client < Base::Client
    def platform
      "platform_b"
    end

    def venue_class
      PlatformB::Venue
    end
  end
end
