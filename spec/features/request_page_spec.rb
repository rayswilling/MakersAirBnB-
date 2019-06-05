feature 'View a list of requests' do 

    scenario 'user can visit request page' do
        signup_user
        click_button 'Requests'
        expect(page).to have_content("Requests I've Made")
        expect(page).to have_content("Requests I've Received")
    end
        
    
    # scenario 'A user can view requests they have sent' do 
    #      signup_user
    #      Listing.create(name: "Dork Den", description: "Its a den for dorks", price: "420")
    #      click_button 'Requests'
    #      expect(page).to have_content('Its a den for dorks')
    #  end 
end 

