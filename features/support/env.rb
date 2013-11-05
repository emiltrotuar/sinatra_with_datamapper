ENV['RACK_ENV'] = 'test'

require File.dirname(__FILE__) + '/../../app'

require 'capybara/cucumber'
require 'rspec/expectations'
require 'cucumber/rspec/doubles'

begin
	require 'database_cleaner'
	require 'database_cleaner/cucumber'
	DatabaseCleaner.strategy = :truncation
rescue NameError
	raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

module DataMapper
	module Adapters
		class SqliteAdapter
			private

			def uses_sequence
				select("SELECT name FROM sqlite_master WHERE type='table' AND name='sqlite_sequence';").include?("sqlite_sequence")
			end
		end
	end
end

Before do
	DatabaseCleaner.start
end

After do
	DatabaseCleaner.clean
end

Capybara.app = Sinatra::Application