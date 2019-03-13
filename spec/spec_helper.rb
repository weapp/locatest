# frozen_string_literal: true

require "simplecov"
SimpleCov.start { add_filter "/spec/" }

ENV["APP_ENV"] ||= "test"
require ::File.expand_path("../../app", __FILE__)
Dir[::File.expand_path("../support/**/*.rb", __FILE__)].sort.each { |file| require file }

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include RSpec::VenueHelpers
  conf.include RSpec::WebHelpers
  conf.include RSpec::PlatformAHelpers
  conf.include RSpec::PlatformBHelpers
  conf.include RSpec::PlatformCHelpers
end
