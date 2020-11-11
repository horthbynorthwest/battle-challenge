require 'game'

describe Game do
  let(:player1) { double :player1 }
  let(:player2) {double :player2 }
  let(:game) { Game.new(player1, player2)}

  describe '#initialize' do
    it 'player 1 = player1' do
      expect(game.player_1).to eq player1
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end
end
