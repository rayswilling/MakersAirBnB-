# frozen_string_literal: true

feature 'View a list of requests' do
  scenario 'user can visit request page' do
    signup_user
    click_button 'Requests'
    expect(page).to have_content("Requests I've Made")
    expect(page).to have_content("Requests I've Received")
  end
  scenario 'A user can view requests they have sent' do
    signup_user
    create_listing
    click_button 'Log out'
    signup_user_2
    click_link 'Test'
    fill_in('arrival_date', with: '07/05/2019')
    click_button 'Request to book'
    expect(page).to have_content('Testing like a champ')
    expect(page).to have_content('07/05/2019')
    expect(page).to have_content('Not confirmed')

  end
end
