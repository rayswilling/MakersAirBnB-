feature 'Confriming and denying' do 
    it 'displays the request information' do 
        signup_user
        space = Listing.create(name: "Franks house", description: "Lovely place", price: "23", available_from: '05/08/2020', available_until: '10/08/2020')
        visit('/spaces')
        click_link('Franks house')
        fill_in('arrival_date', with: '05/06/2019')
        click_button('Request to book')
        click_link('Franks house')
        expect(page).to have_content('From: test@test.com')
    end 
end 


