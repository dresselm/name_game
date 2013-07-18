require 'rubygems'
require 'bundler/setup'

require 'sinatra' unless defined?(Sinatra)

configure do
  $LOAD_PATH.unshift("#{__dir__}/lib")
  Dir.glob("#{__dir__}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end