require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryBot.create(:notification)).to be_valid
  end

  it "is not valid without a user" do
    expect(FactoryBot.build(:notification, user: nil)).not_to be_valid
  end

  it "is not valid without content" do
    expect(FactoryBot.build(:notification, content: nil)).not_to be_valid
  end
end
