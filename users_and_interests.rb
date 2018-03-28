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
  redirect '/' if !params[:name] || params[:name].empty?

  @user_index = find_user_index(params[:name])
  redirect '/' if !@user_index

  erb :user
end

def find_user_index(name)
  @users.find_index do |user|
    user.first.to_s == name.downcase
  end
end
