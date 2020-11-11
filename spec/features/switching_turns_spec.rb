feature 'switching turns' do
  scenario 'see turn at start' do
    sign_in_and_play
    expect(page).to have_content "Symion's turn"
  end

  scenario 'after player 1 attacks' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'OK'
    expect(page).not_to have_content "Symion's turn"
    expect(page).to have_content "Georgie's turn"
  end
end
