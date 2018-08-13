# 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
require 'sinatra'
require 'curb'


get '/' do
  erb :home
end


get '/cookies' do
  erb :cookies
end

get '/cakes' do
  erb :cakes
end

get '/muffins' do
  erb :muffins
end
