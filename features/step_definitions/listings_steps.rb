
Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user_attributes|
    User.create!(
      email: user_attributes['email'],
      encrypted_password: user_attributes['encrypted_password'],
      full_name: user_attributes['full_name'],
      seller: user_attributes['seller'] == 'true', # Convert string to boolean
      password: 'password', # Setting a default password for all users
      password_confirmation: 'password' # Required for some Devise setups
      )
  end
end

Given('the following listings exist:') do |table|
  table.hashes.each do |listing|
    Listing.create!(
      name: listing['name'],
      description: listing['description'],
      price: listing['price'].to_f,
      user_id: listing['user_id'].to_i,
      photos: JSON.parse(listing['photos']),
      is_sold: listing['is_sold'] == 'true',
    )
  end
end

Given('the following tags exist:') do |table|
  table.hashes.each do |tag|
    Tag.create!(name: tag['name'])
  end
end

When('I assign the following tags to the listings:') do |table|
  table.hashes.each do |row|
    listing = Listing.find_by(name: row['name'])
    next if listing.nil?

    tags = row['tags'].split(',').map(&:strip)
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      listing.tags << tag unless listing.tags.include?(tag)
    end
  end
  end

Given("I am on the home page") do
  visit root_path
end

When("I set the minimum price to {string}") do |min_price|
  fill_in 'min_price', with: min_price
end

When("I set the maximum price to {string}") do |max_price|
  fill_in 'max_price', with: max_price
end

When("I select the tag {string} from the filter dropdown") do |tag_name|
  select tag_name, from: 'tags'
end

When("I apply the tag filter") do
  click_button 'Filter'
end

When("I click on {string}") do |link_text|
  click_link link_text
end

Then("I should see a list of available listings") do
  expect(page).to have_selector('.grid-item')
end

Then("I should see filtered listings within the specified price range") do
  min_price = find_field('min_price').value.to_f
  max_price = find_field('max_price').value.to_f

  click_button 'Filter'

  within('.grid-container') do
    all('.listing-price').each do |price_element|
      price = price_element.text.delete('$').to_f
      expect(price).to be >= min_price
      expect(price).to be <= max_price
    end
  end
end

Then("I should see listings tagged as {string}") do |tag_name|
  within('.grid-container') do
    all('.listing').each do |listing|
      expect(listing).to have_content(tag_name)
    end
  end
end

Then("I should see listings sorted by price from low to high") do
  sorted_prices = all('.listing-price')
                    .map { |price| price.text.delete('$').to_f }
                    .reject { |price| price.zero? }
  expect(sorted_prices).to eq(sorted_prices.sort)
end

Then("I should see listings sorted by price from high to low") do
  sorted_prices = all('.listing-price').map { |price| price.text.delete('$').to_f }
  expect(sorted_prices).to eq(sorted_prices.sort.reverse)
end

Then("I should see listings sorted by newest first") do
  sorted_dates = all('.listing-created-at')
                   .map { |date| DateTime.parse(date.text) }
  expect(sorted_dates).to eq(sorted_dates.sort.reverse)
end

Then("I should see listings sorted by oldest first") do
  sorted_dates = all('.listing-created-at')
                   .map { |date| DateTime.parse(date.text) }
  expect(sorted_dates).to eq(sorted_dates.sort)
end

