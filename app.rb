require 'sinatra/base'

class Battleapp < Sinatra::Base
  set :sessions, true
  set :foo, 'bar'

  get '/' do
    'Testing infrastructure working!'
  end
end
