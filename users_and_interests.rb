# users_and_interests.rb

require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @users = YAML.load_file('users.yaml')
end

get '/' do
  erb :home
end

get '/user' do
  @name = params[:name].downcase.to_sym
  redirect '/' if !@name || @name.empty?
  redirect '/' unless @users.key? @name

  erb :user
end
