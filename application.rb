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

get '/' do
  first_names  = ['Michael', 'Steven', 'James']
  middle_names = ['Oscar', 'Kevin', 'Nicholas']

  erb :names, :locals => {:first_names  => first_names,
                          :middle_names => middle_names,
                          :last_name    => 'TheLastName'}
end

Battle = Struct.new(:name1, :name2)
get '/battle' do
  battle = Battle.new('Michael Kevin TheLastName', 'James Oscar TheLastName')
  erb :battle, :locals => {:battle => battle}
end

Standing = Struct.new(:name, :wins, :losses, :win_pct)
get '/standings' do
  standings = [Standing.new('Michael Oscar TheLastName', 20, 5, '80%')]

  erb :standings, :locals => {:standings => standings}
end