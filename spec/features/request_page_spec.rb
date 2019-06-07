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
    click_link 'Testing like a champ'
    fill_in('arrival_date', with: '07/05/2019')
    click_button 'Request to book'
    expect(page).to have_content('Testing like a champ')
    expect(page).to have_content('07/05/2019')
    expect(page).to have_content('Not confirmed')
  end

  scenario 'A user can view requests they have received' do
    signup_user
    create_listing
    click_button 'Log out'
    signup_user_2
    click_link 'Testing like a champ'
    fill_in('arrival_date', with: '07/05/2019')
    click_button 'Request to book'
    click_button 'Log out'
    click_link 'Login'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '123')
    click_button 'Log in'
    click_button 'Requests'
    expect(page).to have_content('Testing like a champ')
    expect(current_path).to eq('/requests')


    # sign up user 1
    # create a listing
    # sign out
    # sign up user 2
    # request that listing
    # sign out
    # log in user 1
    # click requests button
    # expect page lalala
  end
end
