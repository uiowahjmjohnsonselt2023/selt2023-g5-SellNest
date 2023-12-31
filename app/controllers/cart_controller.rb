class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:add_item, :show, :remove_item, :checkout]

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

  def add_item_to_cart
    cart_item = @cart.cart_items.find_or_initialize_by(listing_id: params[:listing_id])
    cart_item.quantity = (cart_item.quantity || 0) + 1
    cart_item.save
  end

  def checkout
    order = nil
    if @cart.cart_items.any?
      ActiveRecord::Base.transaction do
        order = current_user.orders.create!(total: @cart.total_price, status: 'complete')

        @cart.cart_items.each do |item|
          order.order_items.create!(listing: item.listing, quantity: item.quantity)
          # Remove the listing from the active listings
          item.listing.update(is_sold: true)
          Notification.create!(
            user: item.listing.user,
            content: "Your item #{item.listing.name} has been sold!",
            read: false
          )
        end

        # Clear the cart items after checkout
        @cart.cart_items.destroy_all
      end

      redirect_to user_path(current_user.id), notice: 'Thank you for your purchase!'
    else
      redirect_to cart_path, alert: 'Your cart is empty.'
    end
  rescue ActiveRecord::RecordInvalid => e
    # If the transaction fails, redirect to the cart page with an error message
    redirect_to cart_path, alert: "Checkout failed: #{e.message}"
  end


  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
