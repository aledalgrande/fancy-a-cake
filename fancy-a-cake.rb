require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

post '/request_cake' do
  
end