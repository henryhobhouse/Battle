require 'sinatra/base'

class Battleapp < Sinatra::Base
  set :sessions, true

  get '/' do
    erb(:index)
  end

  post '/' do
    @player_one = params[:player_one]
    @player_two = params[:player_two]
    erb(:index)
  end

  run! if app_file == $0
end
