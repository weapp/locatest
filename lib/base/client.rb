# frozen_string_literal: true

module Base
  class Client < Foxy::Client
    include Singleton

    class << self
      def platforms
        @platforms ||= []
      end

      def register_platform(platform)
        platforms << platform
      end

      def update_venue_in_all_platforms(data)
        platforms.each { |platform| platform.instance.update_async_from_standard(data) }
      end
    end

    def initialize(*)
      super
      default_options[:params][:api_key] = ENV["RAILS_CODE_CHALLENGE_API_KEY"]
      default_options[:headers]["Content-Type"] = "application/json"
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

    def venue_class
      raise NotImplementedError
    end

    def update_worker
      raise NotImplementedError
    end

    def venue(venue = "venue")
      venue_call(path: path(venue))
    end

    def update_venue(data, venue = "venue")
      venue_call(method: :patch,
                 path: path(venue),
                 body: { venue: venue_class.new(data).as_json })
    end

    def update_async_from_standard(data)
      update_worker.perform_async(venue_class.from_standard(data).as_json)
      # update_worker.new.perform(venue_class.from_standard(data).as_json)
    end

    def path(venue)
      "/#{platform}/#{venue}"
    end

    def venue_call(**option)
      call(**option).ok_then { |body| venue_class.from_json(body) }
    end

    def call(**option)
      response = request(**option)
      return Response.new(:error, response.status) unless response.status == 200

      Response.new(:ok, response.body)
    rescue StandardError => e
      Response.new(:error, e)
    end

    def request(**options)
      opts = default_options.deep_merge(options)

      method_name = opts.fetch(:method, :get)
      path = opts.fetch(:path, "/")
      body = opts.fetch(:body, nil)
      params = opts.fetch(:params, nil)
      headers = opts.fetch(:headers, {})

      body = body.to_json if body

      # return App.debug(method: method_name,
      #                  path: path,
      #                  params: params,
      #                  headers: headers,
      #                  body: body)

      @conn.run_request(method_name, path, body, headers) do |request|
        request.params.update(params) if params
        yield(request) if block_given?
      end
    end
  end
end
