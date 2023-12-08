require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:listing) }
  end

  describe 'before_create set_default_quantity' do
    it 'sets default quantity to 1 before creation' do
      cart_item = CartItem.create
      expect(cart_item.quantity).to eq(1)
    end

    it 'does not override quantity if already set' do
      cart_item = CartItem.create(quantity: 5)
      expect(cart_item.quantity).to eq(5)
    end
  end
end