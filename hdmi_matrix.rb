require 'sinatra'
require 'sinatra/reloader' if development?
require './devices/hdx-404e'

matrix = Hdx404e.new

get '/' do
  redirect '/index.html'
end

post '/preset' do
  puts "setting preset"
  matrix.preset(params[:preset])
end

post '/' do
  puts "Switching: "
  puts params.inspect
  matrix.switch(params[:output], params[:input])
end

