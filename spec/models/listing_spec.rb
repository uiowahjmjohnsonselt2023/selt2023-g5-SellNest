require 'rails_helper'

RSpec.describe Listing, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      listing = Listing.new(title: 'Charming Apartment', description: 'Spacious and modern', price: 1200)
      expect(listing).to be_valid
    end

    it 'is invalid without a title' do
      listing = Listing.new(description: 'Spacious and modern', price: 1200)
      expect(listing).not_to be_valid
    end
  end
end
