ENV['RACK_ENV'] = 'test'
$LOAD_PATH << File.expand_path('../..', __FILE__)

require 'overlord'
require 'capybara/rspec'
require 'capybara/webkit'
require 'pry'

Dir[File.join(File.expand_path('.'), 'spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FlashHelpers, type: :feature
end

Capybara.configure do |config|
  config.current_driver = :webkit
end

Capybara.app = Sinatra::Application.new
