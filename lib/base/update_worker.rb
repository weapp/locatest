# frozen_string_literal: true

require "foxy/model"

module Base
  class UpdateWorker
    Retry = Class.new(StandardError)

    include Sidekiq::Worker

    def perform(data)
      response = client.instance.update_venue(data)
      return if response.ok?

      raise Retry, "retry worker: #{response.error}"
    end

    def client
      raise NotImplementedError
    end
  end
end
