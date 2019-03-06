# frozen_string_literal: true

module PlatformC
  class Client < Base::Client
    def platform
      "platform_c"
    end

    def venue_class
      PlatformC::Venue
    end
  end
end
