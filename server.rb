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



get '/home' do
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

get '/events' do
  results = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search//?q=baking&location.address=NYC&token=#{ ENV['API_TOKEN'] }")
  @data = results.body_str
  @events = JSON.parse(@data)
  @events_data = @events['events']
  erb :events
end





class Muffin
  attr_accessor :name, :price, :description
end


class Cake
  attr_accessor :name, :price, :description
end
