require 'sinatra'
require 'sinatra/reloader' if development?
require './devices/hdx-404e'

get '/' do
  redirect '/index.html'
end

post '/' do
  puts "Switching: "
  puts params.inspect
  matrix = Hdx404e.new.switch(params[:output], params[:input])
end