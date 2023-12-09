# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:cart).dependent(:destroy) }
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:bookmarks).dependent(:destroy) }
    it { is_expected.to have_many(:listings) }
    it { is_expected.to have_many(:notifications).dependent(:destroy) }
    it { is_expected.to have_many(:reviews) }
  end

  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:seller).in_array([true, false]) }
  end

  describe '#bookmarked?' do
    let(:user) { create(:user) }
    let(:listing) { create(:listing) }

    it 'returns true if the user has bookmarked the listing' do
      user.bookmarks.create(listing: listing)
      expect(user.bookmarked?(listing)).to be_truthy
    end

    it 'returns false if the user has not bookmarked the listing' do
      expect(user.bookmarked?(listing)).to be_falsy
    end
  end

  describe 'callbacks' do
    it 'creates a cart for the user after creation' do
      user = create(:user)
      expect(user.cart).to be_present
    end
  end

  describe 'Omniauth' do
    let(:auth_hash) do
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '123456',
        info: {
          email: 'test@example.com',
          name: 'Test User',
          image: 'http://example.com/image.png'
        }
      )
    end

    context 'when user does not exist' do
      it 'creates a new user using OAuth data' do
        expect do
          user = User.from_omniauth(auth_hash)
          expect(user).to be_persisted
          expect(user.email).to eq('test@example.com')
          expect(user.full_name).to eq('Test User')
          expect(user.avatar_url).to eq('http://example.com/image.png')
        end.to change(User, :count).by(1)
      end
    end

    context 'when user already exists' do
      let!(:existing_user) { create(:user, provider: 'google_oauth2', uid: '123456') }

      it 'returns the existing user' do
        expect do
          user = User.from_omniauth(auth_hash)
          expect(user).to eq(existing_user)
        end.not_to change(User, :count)
      end
    end

    context 'when user creation fails' do
      before do
        allow_any_instance_of(User).to receive(:save).and_return(false)
      end

      it 'returns nil' do
        expect(User.from_omniauth(auth_hash)).to be_nil
      end
    end
  end

  # You can add more tests for other methods or edge cases within the User model

end
