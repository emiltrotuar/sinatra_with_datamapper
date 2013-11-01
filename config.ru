require 'rubygems'
require 'sinatra'
require 'app'  

# Sinatra defines #set at the top level as a way to set application configuration
set :views, File.join(File.dirname(__FILE__), 'views','models','db')
set :run, false
set :env, (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)

run Sinatra.application