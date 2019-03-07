# frozen_string_literal: true

module PlatformC
  class UpdateWorker < Base::UpdateWorker
    def client
      PlatformC::Client
    end
  end
end
