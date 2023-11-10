Given(/^I am on the login page$/) do
  visit 'user/login' # Replace with the correct path
end

When(/^I enter valid credentials$/) do
  fill_in 'Email', with: 'user@example.com' # Replace with actual field names
  fill_in 'Password', with: 'password'
  click_button 'Login'
end