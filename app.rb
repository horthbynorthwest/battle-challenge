require 'sinatra/base'
require './lib/game'
require './lib/player'


class Battle < Sinatra::Base
  #session needs to be set if booting up using shotgun as every request to server
  #refreshes the session
  set :session_secret, 'makers'
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    erb :attack
  end

# below line allows the server to boot up even if we just use ruby app.rb
  run! if app_file == $0

end
