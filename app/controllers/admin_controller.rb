class AdminController < ApplicationController
  def index
    @total_users = User.count
    @items_listed = Listing.count
  end
end