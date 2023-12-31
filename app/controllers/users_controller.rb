class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :become_seller]
  before_action :set_user, only: [:destroy]
  def login
  end

  def set_user
    @user = User.find(params[:id])
  end


  def index
  end

  # Remove this empty definition of signup
  # def signup
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'User was successfully created.'
    else
      render 'signup'
    end
  end

  def show
    @user = current_user
    @total_profit = Listing.where(user_id: @user.id, is_sold: true).sum(:price) * 0.95
    @active_listings =  Listing.where(user_id: @user.id, is_sold: false).count
    @items_listed = Listing.where(user_id: @user.id,).count

    @total_sales_over_time = Order.where(user_id: current_user.id, status: 'complete').group_by_day(:created_at).sum(:total)
    @chart_data2 = @total_sales_over_time.map do |date, total|
      [date.to_date.strftime("%Y-%m-%d"), total.to_f]
    end
    @tagged_listings2 = Tag.joins(:listings).where(listings: {user_id: current_user.id}).group('tags.name').count
  end

  def become_seller
    @user = User.find(params[:id])
    @user.update(seller: true)
    redirect_to user_path, notice: 'You are now a seller!'
  end

  def signup
    @user = User.new
  end

  def destroy
    admin_user = User.find_by(email: "admin@email")

    # reviews user left
    @user.reviews.each do |review|
      review.update(user_id: admin_user.id)
    end

    # unsold listings when getting rid of user
    @user.listings.where(is_sold: false).destroy_all

    # sold listings when getting rid of user
    @user.listings.where(is_sold: true).each do |listing|
      listing.update(user_id: admin_user.id)
      if listing.reviews.any?
        listing.reviews.destroy_all
      end
    end
    @user.orders.each do |order|
      order.update(user_id: admin_user.id)
    end

    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
