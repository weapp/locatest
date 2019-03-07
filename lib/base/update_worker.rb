# frozen_string_literal: true

require "foxy/model"

module Base
  class UpdateWorker
    include Sidekiq::Worker

    def perform(data)
      client.new.update_venue(data)
    end

    def client
      raise NotImplementedError
    end
  end
end
