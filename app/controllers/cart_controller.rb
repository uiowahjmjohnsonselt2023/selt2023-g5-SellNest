class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add_item
    listing = Listing.find(params[:id])
    current_user.cart.listings << listing
    redirect_to cart_path
  end

  def remove_item
    listing = Listing.find(params[:id])
    cart_item = current_user.cart.cart_items.find_by(listing_id: listing.id)
    cart_item.destroy
    redirect_to cart_path
  end
end
