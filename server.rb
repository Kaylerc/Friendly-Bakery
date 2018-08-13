require 'sinatra'
require 'curb'
require 'json'

class Cookie
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end

oatmeal = Cookie.new('Oatmeal', '$2.50', 'yummy oatmeal cooke!')



get '/' do
  erb :home
end

get '/cookies' do
  @oatmeal = oatmeal
  erb :cookies
end

get '/cakes' do
  erb :cakes
end

get '/muffins' do
  erb :muffins
end







class Muffin
  attr_accessor :name, :price, :description
end


class Cake
  attr_accessor :name, :price, :description
end
