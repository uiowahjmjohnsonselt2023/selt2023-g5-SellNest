class AdminController < ApplicationController
  def index
    @total_users = User.count
    @total_sellers = User.where(seller: true).count
    @total_sales = Order.where(status: 'complete').sum(:total)
    @listed_merchandise = Listing.where(is_sold: false).sum(:price)

    @active_listings = Listing.where(is_sold: false).count
    @sold_listings = Listing.where(is_sold: true).count
    @items_listed = Listing.count

    @company_profits = @total_sales * 0.05

    @all_users = User.all
    @all_listings = Listing.all
    @all_orders = Order.all

    @total_sales_over_time = Order.where(status: 'complete').group_by_day(:created_at).sum(:total)
    @chart_data = @total_sales_over_time.map do |date, total|
      [date.to_date.strftime("%Y-%m-%d"), total.to_f]
    end

    @tagged_listings = Tag.joins(:listings).group('tags.name').count
  end
end