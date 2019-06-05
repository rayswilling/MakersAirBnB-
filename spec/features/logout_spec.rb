feature 'Logging out' do
    scenario 'user can log out' do
        signup_user
        click_link('Log out')

    expect(current_path).to eq('/')
    expect(page).to have_content('You have logged out')
    end
end