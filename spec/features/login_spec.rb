feature "Logging in" do
  scenario "clicking 'Login' should take you to a login page" do
    visit '/'
    click_link('Login')
    expect(current_path).to eq('/sessions/new')
  end

  scenario "user can log in" do
    signup_user
    visit '/'
    click_link('Login')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '123')
    click_button('Log in')
    expect(current_path).to eq('/spaces')
  end

  scenario "entering incorrect email takes you to login page" do
    signup_user
    visit '/'
    click_link('Login')
    fill_in('email', with: 'wrong@test.com')
    fill_in('password', with: '123')
    click_button('Log in')
    expect(page).to have_content('Email or password is incorrect')
  end

  scenario "entering incorrect password takes you to login page" do
    signup_user
    visit '/'
    click_link('Login')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '1234')
    click_button('Log in')
    expect(page).to have_content('Email or password is incorrect')
  end
end
