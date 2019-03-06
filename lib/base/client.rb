# frozen_string_literal: true

module Base
  class Client < Foxy::Client
    def initialize(*)
      super
      default_options[:params][:api_key] = ENV["RAILS_CODE_CHALLENGE_API_KEY"]
    end

    def url
      "https://rails-code-challenge.herokuapp.com"
    end

    def user_agent
      "Localtest(R)"
    end

    def platform
      raise NotImplementedError
    end

    def venue(venue = "venue")
      call("/#{platform}/#{venue}").ok_then { |body| venue_class.from_json(body) }
    end

    def call(path)
      response = request(path: path)
      return Response.new(:error, response.status) unless response.status == 200

      Response.new(:ok, response.body)
    end
  end
end
