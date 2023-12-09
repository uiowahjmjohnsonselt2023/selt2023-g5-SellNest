require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:listing) }
  end

  # You might add more tests here for validations, custom methods, etc.
end