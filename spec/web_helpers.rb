require './lib/user'
require './lib/space'

def signup_user(email: 'test@test.com', password: '123', password_confirmation: '123')
  visit '/'

  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('sign_up')

  User.first(email: email)
end

def visit_login_page
  visit '/'
  click_link('Login')
end

def create_space
  click_button('List a Space')
  fill_in('name', with: 'Testing like a champ')
  fill_in('description', with: 'A big ole test')
  fill_in('price', with: '0.99')
  fill_in('available_from', with: '06/05/2019')
  fill_in('available_until', with: '10/05/2019')
  click_button('Submit')
end