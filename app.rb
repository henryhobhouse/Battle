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
    @game = Game.load
    erb :play
  end

  post '/' do
    player_one = Player.new(params[:player_one])
    player_two = Player.new(params[:player_two])
    @game = Game.new(player_one, player_two)
    @game.save
    redirect "/play"
  end

  get '/fight' do
    @game = Game.load
    @game.player_turn_swap
    @game.attack(@game.player_turn)
    @game.save
    @game.player_turn.health <= 0 ? ( redirect "/game-over" ) : ( redirect "/play" )
  end

  get '/game-over' do
    erb :game_over
  end

  run! if app_file == $0
end
