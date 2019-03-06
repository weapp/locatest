#!/usr/bin/env ruby
# frozen_string_literal: true

%w[logger json bundler/setup].each(&method(:require))

APP_ENV = ENV["APP_ENV"] || "development"
Bundler.require(:default, APP_ENV)
$LOAD_PATH.unshift("#{__dir__}/lib")
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].sort.each { |file| require file }
Dotenv.load(".env", ".env.#{APP_ENV}")

class App
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.debug(obj)
    Pry::ColorPrinter.pp(obj)
    obj
  end

  def self.run
    debug "Hello world!"
    debug env: env,
          api_key: ENV["RAILS_CODE_CHALLENGE_API_KEY"]
  end

  def self.env
    APP_ENV
  end
end

App.run if $PROGRAM_NAME == __FILE__
