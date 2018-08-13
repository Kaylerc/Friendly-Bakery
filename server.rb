# 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
require 'sinatra'
require 'sendgrid-ruby'
include SendGrid


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



post '/' do
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: params[:email])
  subject = 'Sending with SendGrid is Fun'
  content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
end




class Muffin
  attr_accessor :name, :price, :description
end


class Cake
  attr_accessor :name, :price, :description
end
