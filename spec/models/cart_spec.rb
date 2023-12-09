require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:listings).through(:cart_items) }
  end

  describe '#total_price' do
    it 'calculates total price of all cart items' do
      cart = Cart.new # Create a new cart
      listing1 = Listing.create(name: 'Item 1', price: 20)
      listing2 = Listing.create(name: 'Item 2', price: 30)

      cart_item1 = cart.cart_items.new(listing: listing1, quantity: 2)
      cart_item2 = cart.cart_items.new(listing: listing2, quantity: 3)

      expect(cart.total_price).to eq(2 * 20 + 3 * 30)
    end

    it 'returns 0 if cart is empty' do
      cart = Cart.new # Create a new cart

      expect(cart.total_price).to eq(0)
    end
  end
end