Given(/^I am on the signup page$/) do
  visit 'user/signup' # Replace with the correct path
end

When(/^I fill in the signup form$/) do
  fill_in 'Username', with: 'newuser'
  fill_in 'Email', with: 'newuser@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

And(/^I submit the form$/) do
  click_button 'Sign Up'
end