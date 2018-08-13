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


class Cookie
  attr_accessor :name, :price, :description
end

ck1 = Cookie.new('Oatmeal', '$2.50', 'yummy oatmeal cooke!')


class Muffin
  attr_accessor :name, :price, :description
end


class Cake
  attr_accessor :name, :price, :description
end
