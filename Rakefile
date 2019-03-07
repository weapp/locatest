# frozen_string_literal: true

require "sinatra/activerecord/rake"

task default: %w[test]

task :test do
  sh "bundle exec rspec spec"
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
