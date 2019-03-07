# frozen_string_literal: true

module PlatformA
  class UpdateWorker < Base::UpdateWorker
    def client
      PlatformA::Client
    end
  end
end
