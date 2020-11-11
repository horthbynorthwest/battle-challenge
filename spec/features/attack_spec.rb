feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Symion attacked Georgie"
  end

  scenario 'reduce PLayer 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content "Georgie: 60HP"
    expect(page).to have_content "Georgie: 50HP"
  end
end