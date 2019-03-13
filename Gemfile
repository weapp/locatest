# frozen_string_literal: true

source "https://rubygems.org"

gem "mysql2", "~> 0.5.2"
gem "sinatra-activerecord", require: "sinatra/activerecord"

gem "dotenv"
gem "foxy", github: "weapp/foxyrb"

# web
gem "dry-schema"
gem "dry-validation"
gem "rack", "~> 2.0.4"
gem "sinatra", "~> 2.0.1", require: "sinatra/base"
gem "thin"

# sidekiq
gem "redis"
gem "redis-namespace"
gem "sidekiq", "4.2.10"

group :development, :test do
  gem "foreman", require: false
  gem "pry"
  gem "rack-test"
  gem "rake", require: false
  gem "rb-readline", require: false
  gem "rerun", require: false
  gem "rspec", require: false
  gem "rubocop", require: false
  gem "simplecov", require: false
end
