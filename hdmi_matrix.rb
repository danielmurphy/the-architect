require 'sinatra'
require 'sinatra/reloader' if development?
require './devices/hdx-404e'

get '/hi' do
  puts "hi"
  "HELLO WORLD!"
end

post '/' do
  puts '/routes'
  puts params.inspect
  matrix = Hdx404e.new.switch(params[:output], params[:input])
end