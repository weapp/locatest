# frozen_string_literal: true

module PlatformA
  class Client < Base::Client
    def platform
      "platform_a"
    end

    def venue_class
      PlatformA::Venue
    end
  end
end
