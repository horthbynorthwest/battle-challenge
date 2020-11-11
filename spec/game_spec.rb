require 'game'

describe Game do
  let(:player1) { double :player1 }
  let(:player2) {double :player2 }

  describe '#attack' do
    it 'damages the player' do
      expect(player2).to receive(:receive_damage)
      subject.attack(player2)
    end
  end

end
