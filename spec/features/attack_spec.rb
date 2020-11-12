feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Symion attacked Georgie"
  end
  scenario 'be attacked by Player 2' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content "Georgie attacked Symion"
  end

  context 'when dealing set damage' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
    end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    attack_and_confirm
    expect(page).not_to have_content "Symion: 60HP"
    expect(page).to have_content "Symion: 50HP"
  end
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content "Georgie: 60HP"
    expect(page).to have_content "Georgie: 50HP"
    end
  end
end
