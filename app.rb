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
    $player_one = Player.new(params[:player_one])
    $player_two = Player.new(params[:player_two])
    redirect "/play"
  end

  get '/fight' do
    @game = Game.new
    @game.attack($player_two)
    erb :fight
  end

  run! if app_file == $0
end
