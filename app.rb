require 'sinatra/base'
require_relative './lib/player.rb'


class Battle < Sinatra::Base
  #session needs to be set if booting up using shotgun as every request to server
  #refreshes the session
  set :session_secret, 'makers'
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :play
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2)
    erb :attack
  end

# below line allows the server to boot up even if we just use ruby app.rb
  run! if app_file == $0

end
