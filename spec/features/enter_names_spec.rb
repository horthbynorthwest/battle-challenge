feature 'enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Symion'
    fill_in :player_2_name, with: 'Georgie'
    click_button 'Submit'
    expect(page).to have_content 'Symion vs Georgie'
  end
end
