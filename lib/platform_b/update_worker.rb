# frozen_string_literal: true

module PlatformB
  class UpdateWorker < Base::UpdateWorker
    def client
      PlatformB::Client
    end
  end
end
