require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './spec/features/web_helpers.rb'
require 'pry'

class Battleapp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/' do
    player_one = Player.new(params[:player_one])
    player_two = Player.new(params[:player_two])
    @game = Game.create(player_one, player_two)
    redirect "/player"
  end

  before do
    @game = Game.load
  end

  get '/player' do
    erb :player
  end

  get '/vscomp' do
    erb :vscomp
    @game.player_turn_swap
    @game.attack(@game.player_turn)
    @player_health = @game.player_turn.health
    @player_health <= 0 ? ( redirect "/game-over" ) : ( redirect "/player" )
  end

  get '/fight' do
    @game.player_turn_swap
    @game.attack(@game.player_turn)
    @player_health = @game.player_turn.health
    @player_health <= 0 ? ( redirect "/game-over" ) :
    @game.is_computer == @game.player_turn.name ? ( redirect '/vscomp' ) :
    ( redirect '/player' )
  end

  get '/game-over' do
    erb :game_over
  end

  run! if app_file == $0
end
