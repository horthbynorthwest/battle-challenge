require 'player'

describe Player do
  let(:player1) {Player.new('Symion')}
  let(:player2) {Player.new('Georgie')}

  it 'returns the players name' do
    expect(player1.name).to eq 'Symion'
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(player1.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

    describe '#receive_damage' do
      it 'reduces the player hit points' do
        expect { player2.receive_damage(10) }.to change { player2.hit_points }.by(-10)
      end
    end

end
