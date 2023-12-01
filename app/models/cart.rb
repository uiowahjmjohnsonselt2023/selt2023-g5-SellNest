class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :listings, through: :cart_items

  def total_price
    cart_items.sum { |item| item.quantity * item.listing.price }
  end
end
