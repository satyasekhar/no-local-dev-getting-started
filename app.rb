# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Contact < ActiveRecord::Base
  self.table_name = 'herokurubysfdc1.contact'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end

get "/" do
  erb :home
end

get '/new' do
  erb :form
end

post '/new' do
  Contact.create  params[:contact]
  redirect to('/contacts')
end

class Contact < ActiveRecord::Base
  self.table_name = 'herokurubysfdc1.contact'
end

#get "/contacts" do
#  @contacts = Contact.all
#  erb :index
#end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
