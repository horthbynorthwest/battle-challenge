require 'game'

describe Game do
  let(:player1) { double :player, hit_points: 60 }
  let(:player2) { double :player, hit_points: 60 }
  let(:dead_player) { double :player, hit_points: 0 }
  subject(:finished_game) { Game.new(dead_player,player2) }
  subject(:game) { Game.new(player1, player2) }


  describe '#initialize' do
    it 'player 1 = player1' do
      expect(game.player_1).to eq player1
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player2
    end
  end

  describe '#opponent_of' do
    it 'finds the opponent of a player' do
      expect(game.opponent_of(player1)).to eq player2
      expect(game.opponent_of(player2)).to eq player1
    end
  end

  describe '#game_over?' do
    it 'returns false if no-one is at 0 HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least 1 player is at 0 HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'returns a player on less than 0 HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end
