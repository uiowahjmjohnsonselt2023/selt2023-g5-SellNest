# features/step_definitions/listing_steps.rb

Given('I am logged in as an admin') do
  # Code to log in admin
end

When('I go to the new listing page') do
  visit new_listing_path
end

When('I fill in the listing details') do
  fill_in 'Title', with: 'Charming Apartment'
  fill_in 'Description', with: 'Spacious and modern'
  fill_in 'Price', with: 1200
end

When('I submit the listing form') do
  click_button 'Create Listing'
end

Then('I should see a confirmation that the listing was created') do
  expect(page).to have_content('Listing was successfully created.')
end
