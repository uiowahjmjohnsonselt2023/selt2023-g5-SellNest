class AdminController < ApplicationController
  def index
    @total_users = User.count
    @total_sellers = User.where(seller: true).count
    @total_sales = Order.sum(:total)
    @listed_merchandise = Listing.where(is_sold: false).sum(:price)

    @active_listings = Listing.where(is_sold: false).count
    @sold_listings = Listing.where(is_sold: true).count
    @items_listed = Listing.count

    @company_profits = @total_sales * 0.05
    @all_users = User.all
  end
end