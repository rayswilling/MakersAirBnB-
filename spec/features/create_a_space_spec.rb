feature 'View a list of spaces' do


  scenario 'allows user to create a new listing' do
    visit('/spaces')
    expect(page).to have_button('List a Space')
  end

  scenario 'page shows all spaces' do
    User.create(email:"gary@me.com", password: "hello")
    Listing.create(name: "Franks house", description: "Lovely place", price: "23")
    visit('/spaces')
    expect(page).to have_content('Franks house')
  end

  scenario "add a new listing" do
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
