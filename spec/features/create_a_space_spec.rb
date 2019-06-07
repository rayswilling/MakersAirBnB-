feature 'View a list of spaces' do

  scenario 'allows user to create a new listing' do
    visit('/spaces')
    expect(page).to have_button('List a Space')
  end

  scenario "add a new listing" do
    signup_user
    create_listing
    expect(page).to have_content("Testing like a champ")
  end

  scenario 'page shows all spaces' do
    signup_user
    create_listing
    create_another_listing
    expect(page).to have_content('Testing like a champ')
    expect(page).to have_content('Test 2')
  end
end
