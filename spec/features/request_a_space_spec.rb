feature 'Request to book' do 

    scenario 'user can request to book a space' do 
        user = signup_user
        space = Space.create(
            name: "Franks house", 
            description: "Lovely place", 
            price: "23", 
            available_from: '05/08/2020', 
            available_until: '10/08/2020',
            user: user)

        visit('/spaces')
        click_link('Franks house')

        expect(current_path).to eq("/spaces/#{space.id}")
    end 

    scenario 'clicking a space takes you to a landing page' do
        user = signup_user
        space = Space.create(
            name: "Franks house", 
            description: "Lovely place", 
            price: "23", 
            available_from: '05/08/2020', 
            available_until: '10/08/2020',
            user: user)

        visit('/spaces')
        click_link('Franks house')

        expect(page).to have_content(space.name)
        expect(page).to have_content(space.description)
    end

    scenario 'we should be able to see the dates a property is available for' do 
        user = signup_user
        space = Space.create(
            name: "Franks house", 
            description: "Lovely place", 
            price: "23", 
            available_from: '05/08/2020', 
            available_until: '10/08/2020',
            user: user)

        visit('/spaces')

        click_link('Franks house')
        fill_in('arrival_date', with: '05/06/2019')
        click_button('Request to book')

        expect(page).to have_content('Thanks for your request. The owner has been notified.')
    end
end