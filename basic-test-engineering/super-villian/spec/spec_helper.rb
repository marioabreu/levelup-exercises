ENV['RACK_ENV'] = 'test'
$LOAD_PATH << File.expand_path('../..', __FILE__)

require 'overload'
require 'capybara/rspec'
require 'capybara/webkit'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.current_driver = :webkit
end

Capybara.app = Sinatra::Application.new