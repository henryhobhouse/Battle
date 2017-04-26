require 'sinatra/base'

class Battleapp < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_one = session[:player_one]
    @player_two = session[:player_two]
    erb(:play)
  end

  post '/' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    redirect "/play"
  end

  run! if app_file == $0
end
