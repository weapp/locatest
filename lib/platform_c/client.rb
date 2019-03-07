# frozen_string_literal: true

module PlatformC
  class Client < Base::Client
    Base::Client.register_platform(self)

    def platform
      "platform_c"
    end

    def venue_class
      PlatformC::Venue
    end

    def update_worker
      PlatformC::UpdateWorker
    end
  end
end
