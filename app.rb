#!/usr/bin/env ruby
# frozen_string_literal: true

require File.expand_path("config/boot", File.dirname(__FILE__))

class App
  def self.initialize!
    Dir["#{App.root}/lib/**/*.rb"].sort.each { |file| require file }
    Dir["#{App.root}/config/initializers/**/*.rb"].sort.each { |file| require file }
    Dir["#{App.root}/app/**/*.rb"].sort.each { |file| require file }
  end

  def self.root
    File.dirname(__FILE__)
  end

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

App.initialize!

App.run if $PROGRAM_NAME == __FILE__
