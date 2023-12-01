class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:add_item, :show, :remove_item]

  def show
    @cart = current_user.cart
  end

  def add_item
    listing = Listing.find(params[:id])
    @cart.listings << listing
    redirect_to cart_path
  end

  def remove_item
    listing = Listing.find(params[:id])
    cart_item = current_user.cart.cart_items.find_by(listing_id: listing.id)
    cart_item.destroy
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
