require 'sinatra/base'
require './lib/game'
require './lib/player'
require './lib/attack'


class Battle < Sinatra::Base
  #session needs to be set if booting up using shotgun as every request to server
  #refreshes the session
  set :session_secret, 'makers'
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    Attack.run(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    erb :attack
  end


  post '/switch_turns' do
    @game.switch_turns
    redirect ('/play')
  end

  get '/game-over' do
    erb :game_over
  end

# below line allows the server to boot up even if we just use ruby app.rb
   run! if app_file == $0

end
