# frozen_string_literal: true

require "foxy/model"

module Base
  class UpdateWorker
    include Sidekiq::Worker

    def perform(data)
      response = client.new.update_venue(data)
      return if response.ok?

      raise "retry worker: #{response.error}"
    end

    def client
      raise NotImplementedError
    end
  end
end
