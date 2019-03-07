# frozen_string_literal: true

module PlatformB
  class Client < Base::Client
    Base::Client.register_platform(self)

    def platform
      "platform_b"
    end

    def venue_class
      PlatformB::Venue
    end

    def update_worker
      PlatformB::UpdateWorker
    end
  end
end
