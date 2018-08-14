require 'sinatra'
require 'curb'
require 'json'




class Muffin
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end

blue = Muffin.new('Blueberry', '$5.50', 'Our classic blueberry muffin lightly sprinkled with sugar')
orcran = Muffin.new('Orange-Cranberry', '$5.50', 'Fresh orange zest and locally grown cranberries')
banana = Muffin.new('Banana-Walnut', '$5.50', 'Ripe bananas with chunks of walnuts')



class Cake
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end


strawberry = Cake.new('Strawberry-Swirl Cheesecake', '$15.00', 'Rich velvetycheesecake with organic strawberry puree swirl, on a graham cracker crust ')
confetti = Cake.new('Confetti Celebration', '$30', 'One of our best-selllers!  This vanilla based cake with confetti sprinkles is sure to get the party started!')
chocolate = Cake.new('Double Chocolate', '$35', 'Chocolate lovers, this one is for you!  MOist chocolate layers separated by rich chocolate frosting' )



class Cookie
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end


oatmeal = Cookie.new('Oatmeal Cookie', '$2.50', 'Our signature classic!  Organic oatmeal, juicy raisins and a hint of cinnamon')
chocolate = Cookie.new('Chocolate Chip Cookie', '$2.50', 'Our top seller!! Soft baked with semi-sweet chololate morsels')
snick = Cookie.new('Snickerdoodle Cookie', '$2.50', 'Sugar cookie topped with cinnamon')


get '/home' do
  erb :home
end

get '/cookies' do
  @oatmeal = oatmeal
  @chocolate = chocolate
  @snick = snick
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
