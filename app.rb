require 'sinatra/base'
require './lib/player.rb'

class Battleapp < Sinatra::Base
  enable :sessions
  set :session_secret, ""

  get '/' do
    erb :index
  end

  get '/play' do
    @player_one = session[:player_one]
    @player_two = session[:player_two]
    erb :play
  end

  post '/' do
    session[:player_one] = Player.new(params[:player_one])
    session[:player_two] = Player.new(params[:player_two])
    redirect "/play"
  end

  run! if app_file == $0
end
