# users_and_interests.rb

require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

get '/' do
  @users = YAML.load_file('users.yaml')
end
