require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './spec/features/web_helpers.rb'

class Battleapp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/play' do
    erb :play
  end

  post '/' do
    player_one = Player.new(params[:player_one])
    player_two = Player.new(params[:player_two])
    $game = Game.new(player_one, player_two)
    redirect "/play"
  end

  get '/fight' do
    $game.player_turn_swap
    $game.attack($game.player_turn)
    erb :fight
    redirect "/play"
  end

  run! if app_file == $0
end
