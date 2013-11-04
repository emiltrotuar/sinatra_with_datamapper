ENV['RACK_ENV'] = 'test'

require File.dirname(__FILE__) + '/../../app'

require 'capybara/cucumber'
require 'rspec/expectations'

Capybara.app = Sinatra::Application