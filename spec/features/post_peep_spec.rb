feature 'post peep' do
  visit '/peeps'
  fill_in 'peep', with: "Hi my name is Zoe"
  fill_in 'user', with: "Zoe"
  click_button('Post Peep')

  expect(current_path).to eq '/peeps'
    expect(page).to have_content "Hi my name is Zoe"
end
