feature 'Confirming and denying' do 
    scenario 'displays the request information' do 
        signup_user
        create_listing
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')
        visit('/requests/1')
        # click_link('Testing like a champ')

        expect(page). to have_content("Request for 'Testing like a champ'")
        expect(page).to have_content('From: test@test.com')
        expect(page).to have_content('Date: 06/05/2019')
    end 
 
    scenario 'user can confirm a request' do 
        signup_user
        create_listing
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')
        visit('/requests/1')
        click_button('Confirm Request from test@test.com')

        expect(page).to have_content('Confirmed')
    end 

    scenario 'user can deny a request' do 
        signup_user
        create_listing
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')
        visit('/requests/1')
        click_button('Deny Request from test@test.com')

        expect(page).to have_content('Denied')
    end 

    scenario 'user can see all other requests for that space' do
        signup_user
        create_listing
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')


        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '07/05/2019')
        click_button('Request to book')
        visit('/requests/1')
        expect(page).to have_content('07/05/2019')
    end

    scenario 'other requests on the same day of a confirmed request are denied' do 
        signup_user
        create_listing
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')
        
        visit('/spaces')
        click_link('Testing like a champ')
        fill_in('arrival_date', with: '06/05/2019')
        click_button('Request to book')

        visit('/requests/2')
        click_button('Confirm Request from test@test.com')

        expect(page).to have_content('Confirmed')
        expect(page).to have_content('Denied')
    end 

end 


