feature 'viewing HP' do
  scenario 'player 1 sees player 2s HP' do
    sign_in_and_play
    expect(page).to have_content 'Georgie: 60HP'
  end
end
