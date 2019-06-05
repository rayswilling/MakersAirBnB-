require 'web_helpers'

feature 'User Signup' do
  scenario 'user can signup' do
    signup_user

    expect(current_path).to eq('/spaces')
  end

  scenario 'users cannot sign up without a unique email' do
    signup_user

    expect(current_path).to eq('/spaces')

    signup_user

    expect(current_path).to eq('/')
    expect(page).to have_content('Email in use')
  end

  scenario 'entering different passwords should redirect to homepage' do
    visit '/'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '123')
    fill_in('password_confirmation', with: '1234')
    click_button('sign_up')

    expect(current_path).to eq('/')
    expect(current_path).not_to eq('/spaces')
  end
end
