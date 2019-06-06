feature 'View a list of spaces' do

  scenario 'allows user to create a new space' do
    visit('/spaces')

    expect(page).to have_button('List a Space')
  end

  scenario 'page shows all spaces' do
    user = User.create(email:"gary@me.com", password: "hello")
    space = Space.create(
      name: "Franks house", 
      description: "Lovely place", 
      price: "23", 
      available_from: '05/08/2020', 
      available_until: '10/08/2020',
      user: user)

    visit('/spaces')

    expect(page).to have_content('Franks house')
  end

  scenario "add a new space" do
    signup_user
    visit('/spaces/new')

    fill_in('name', with: 'my house')
    fill_in('description', with: 'my house is nice')
    fill_in('price', with: '£0.99')
    fill_in('available_from', with: '05/08/2020')
    fill_in('available_until', with: '10/08/2020')
    click_button('Submit')

    expect(page).to have_content("my house") 
  end

end
