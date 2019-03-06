ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

require "#{App.root}/db/schema.rb"
