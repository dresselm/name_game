require 'rubygems'
require 'bundler/setup'
require 'sinatra'

require File.join(__dir__, 'environment')

configure do
  set :views, "#{__dir__}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# home page
get '/' do
  erb :home
end