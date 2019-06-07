require './lib/user'
require './lib/dreambnb'

def signup_user
  visit '/'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: '123')
  fill_in('password_confirmation', with: '123')
  click_button('sign_up')
end

def signup_user_2
  visit '/'
  fill_in('email', with: 'test2@test2.com')
  fill_in('password', with: '123')
  fill_in('password_confirmation', with: '123')
  click_button('sign_up')
end

def visit_login_page
  visit '/'
  click_link('Login')
end

def create_listing
  click_button('List a Space')
  fill_in('name', with: 'Testing like a champ')
  fill_in('description', with: 'A big ole test')
  fill_in('price', with: '0.99')
  fill_in('available_from', with: '06/05/2019')
  fill_in('available_until', with: '10/05/2019')
  click_button('Submit')
end

def create_another_listing
  click_button('List a Space')
  fill_in('name', with: 'Test 2')
  fill_in('description', with: 'A big ole test')
  fill_in('price', with: '0.99')
  fill_in('available_from', with: '06/05/2019')
  fill_in('available_until', with: '10/05/2019')
  click_button('Submit')
end