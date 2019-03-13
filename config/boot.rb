# frozen_string_literal: true

require 'bundler'

%w[logger json bigdecimal].each(&method(:require))

APP_ENV = ENV["APP_ENV"] ||  ENV["RACK_ENV"] || "development"
Bundler.require(:default, APP_ENV)
Dotenv.load(".env", ".env.#{APP_ENV}")

["#{__dir__}/../lib"].each { |path| $LOAD_PATH.unshift(path) }
