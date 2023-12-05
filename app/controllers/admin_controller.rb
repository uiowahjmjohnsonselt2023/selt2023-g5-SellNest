class AdminController < ApplicationController
  def index
    @total_users = User.count
    @total_sellers = User.where(seller: true).count
    @total_sales = Order.sum(:total)

    @active_listings = Listing.where(is_sold: false).count
    @sold_listings = Listing.where(is_sold: true).count
    @items_listed = Listing.count
  end
end