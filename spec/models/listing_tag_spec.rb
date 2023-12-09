require 'rails_helper'

RSpec.describe ListingTag, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:listing) }
    it { is_expected.to belong_to(:tag) }
  end

  # Add more tests as needed for validations or any custom methods in ListingTag model
end
