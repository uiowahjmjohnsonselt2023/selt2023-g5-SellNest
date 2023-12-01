class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :listing
  before_create :set_default_quantity

  private

  def set_default_quantity
    self.quantity ||= 1
  end
end
