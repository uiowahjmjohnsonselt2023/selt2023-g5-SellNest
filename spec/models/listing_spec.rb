require 'rails_helper'

RSpec.describe Listing, type: :model do
  it "is not valid without a name" do
    listing = Listing.new(description: 'Some description', price: 100)
    expect(listing).to_not be_valid
  end

  it "is not valid without a description" do
    listing = Listing.new(name: 'Example Listing', price: 100)
    expect(listing).to_not be_valid
  end

  it "is not valid without a price" do
    listing = Listing.new(name: 'Example Listing', description: 'Some description')
    expect(listing).to_not be_valid
  end

  it "is valid with valid attributes" do
    listing = Listing.new(name: 'Example Listing', description: 'Some description', price: 100)
    expect(listing).to be_valid
  end
end

