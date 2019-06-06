feature 'Request to book' do 

    scenario 'user can request to book a space' do
        User.create(email:"gary@me.com", password: "hello")
        space = Listing.create(name: "Franks house", description: "Lovely place", price: "23", available_from: '05/08/2020', available_until: '10/08/2020')
        visit('/spaces')
        click_link('Franks house')

        expect(current_path).to eq("/spaces/#{space.prop_id}")
    end

    scenario 'clicking a space takes you to a landing page' do
        User.create(email:"gary@me.com", password: "hello")
        space = Listing.create(name: "Franks house", description: "Lovely place", price: "23", available_from: '05/08/2020', available_until: '10/08/2020')
        visit('/spaces')
        click_link('Franks house')

        expect(page).to have_content(space.name)
        expect(page).to have_content(space.description)
    end

    scenario 'we should be able to see the dates a property is available for' do
        # User.create(email:"gary@me.com", password: "hello")
        # visit_login_page
        # fill_in('email', with: 'gary@me.com')
        signup_user
        space = Listing.create(name: "Franks house", description: "Lovely place", price: "23", available_from: '05/08/2020', available_until: '10/08/2020')
        visit('/spaces')
        click_link('Franks house')
        fill_in('arrival_date', with: '05/06/2019')
        click_button('Request to book')

        expect(page).to have_content('Thanks for your request. The owner has been notified.')
    end
end
