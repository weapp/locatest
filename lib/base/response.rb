# frozen_string_literal: true

module Base
  class Response
    attr_reader :status, :data

    def initialize(status, data)
      @status = status
      @data = data
    end

    def ok_then
      return Response.new(:ok, yield(data)) if block_given? && ok?

      self
    end

    def error_then
      return Response.new(:error, yield(data)) if block_given? && error?

      self
    end

    def ok?
      status == :ok
    end

    def error?
      status == :error
    end
  end
end
