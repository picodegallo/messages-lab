require 'sinatra'
require 'json'
require "sinatra/activerecord"


set :database, "sqlite3:///ichat.db"


get '/' do
  @messages = Message.all
  erb :messages
end

get '/reset' do
  Message.all.each do |mess|
    mess.destroy
  end
  redirect '/'
  "Messages reset!"
end

post '/' do
  # TODO: Read the message contents, save to the database
  puts "From: #{params[:sender]}"
  puts "To: #{params[:receiver]}"
  puts "Message: #{params[:content]}"
  Message.create([{:sender => params[:sender], :receiver => params[:receiver], :content => params[:content]}])
  erb :messages
end

class Message < ActiveRecord::Base

  # TODO: Use this class as a table in the database

end