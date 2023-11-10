Given(/^I am on the admin dashboard page$/) do
  visit '/admin_dashboard' # Replace '/admin_dashboard' with the actual path to your admin dashboard
end

Then(/^I should see the "Admin Dashboard" header$/) do
  expect(page).to have_content('Admin Dashboard')
end