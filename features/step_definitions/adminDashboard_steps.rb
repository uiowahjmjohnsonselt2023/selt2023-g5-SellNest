Given(/^I am on the admin dashboard page$/) do
  visit '/admin_dashboard' # Replace '/admin_dashboard' with the actual path to your admin dashboard
end

Then(/^I should see the "Admin Dashboard" header$/) do
  expect(page).to have_content('Admin Dashboard')
end

And(/^I should see the total sales stat$/) do
  within('.dashboard-stats') do
    expect(page).to have_content('Total Sales')
    expect(page).to have_css('.stat-value', text: /\d+/) # Check if a number is displayed
  end
end

And(/^I should see the total users stat$/) do
  within('.dashboard-stats') do
    expect(page).to have_content('Total Users')
    expect(page).to have_css('.stat-value', text: /\d+/) # Check if a number is displayed
  end
end

And(/^I should see the total sellers stat$/) do
  within('.dashboard-stats') do
    expect(page).to have_content('Total Sellers')
    expect(page).to have_css('.stat-value', text: /\d+/) # Check if a number is displayed
  end
end

And(/^I should see the total items listed stat$/) do
  within('.dashboard-stats') do
    expect(page).to have_content('Items Listed')
    expect(page).to have_css('.stat-value', text: /\d+/) # Check if a number is displayed
  end
end