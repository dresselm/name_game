require 'rubygems'
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment.rb", __FILE__)
require 'rspec/rails'

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
end
