# frozen_string_literal: true

module PlatformA
  class Client < Base::Client
    Base::Client.register_platform(self)

    def platform
      "platform_a"
    end

    def venue_class
      PlatformA::Venue
    end

    def update_worker
      PlatformA::UpdateWorker
    end
  end
end
