Given("I am logged in as a user") do
  @user = FactoryBot.create(:user)
  login_as(@user, scope: :user)
end

Given("I have unread notifications") do
  @notification = FactoryBot.create(:notification, user: @user, read: false)
end

When("I visit the notifications page") do
  visit notifications_path
end

Then("I should see a list of my notifications") do
  expect(page).to have_content(@notification.content)
end

When("I click on a notification's {string} link") do |link_text|
  click_link link_text
end

Then("that notification should be marked as read") do
  @notification.reload
  expect(@notification.read).to be_truthy
end
