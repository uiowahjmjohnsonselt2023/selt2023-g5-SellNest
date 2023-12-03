class AdminController < ApplicationController
  def index
    @total_users = User.count
    @items_listed = Listing.count
    @total_sellers = User.where(seller: true).count
  end
end