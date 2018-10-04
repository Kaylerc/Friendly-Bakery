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


strawberry = Cake.new('Strawberry Cheesecake', '$25.00', 'Rich velvety cheesecake topped with organic strawberries and juicy chunks blended throughout, on a graham cracker crust ')
custom = Cake.new('Custom Cakes', 'Prices vary', 'You dream it, we make it! Tell us what you need for your soecial day, and we work our magic to make happen!')
chococake = Cake.new('Triple Chocolate', '$35', 'Chocolate lovers, this one is for you!  Moist chocolate layers separated by rich chocolate frosting, topped with fresh berries' )



class Cookie
  attr_accessor :name, :price, :description
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
end


oatmeal = Cookie.new('Oatmeal Cookie', '$2.50', 'A classic!  Oatmeal, juicy raisins and a hint of cinnamon')
chocolate = Cookie.new('Chocolate Chip Cookie', '$2.50', 'Our top seller!! Soft baked with semi-sweet chololate morsels')
lemon = Cookie.new('Lemon Cookie', '$2.50', 'Sweet combination of lemon zest and classic sugar cookie')


get '/home' do
  erb :home
end

get '/index' do
  erb :home
end

get '/cookies' do
  @oatmeal = oatmeal
  @chocolate = chocolate
  @lemon = lemon
  erb :cookies
end

get '/cakes' do
  @sberry = strawberry
  @chococake = chococake
  @custom = custom
  erb :cakes
end

get '/muffins' do
  @blue = blue
  @orcran = orcran
  @banana = banana
  erb :muffins
end

get '/events' do
  results = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search//?q=baking&location.address=NYC&token=FGEP6NNCU7VUSAEVJS4Z")
  @data = results.body_str
  @events = JSON.parse(@data)
  @events_data = @events['events']
  erb :events
end
