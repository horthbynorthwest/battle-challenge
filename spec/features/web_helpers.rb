def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Symion'
  fill_in :player_2_name, with: 'Georgie'
  click_button 'Submit'
end
