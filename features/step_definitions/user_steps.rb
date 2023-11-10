Given(/^I am on the user profile page$/) do
  visit 'user/index' # Replace with the correct path
end

Then(/^I should see the user's photo$/) do
  expect(page).to have_css('img.profile-photo')
end

And(/^I should see the username$/) do
  expect(page).to have_css('.username')
end

And(/^I should see the user profile information$/) do
  expect(page).to have_css('.user-info')
end