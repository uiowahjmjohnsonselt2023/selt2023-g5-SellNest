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
    @user = User.find(params[:id])
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

    @user.listings.where(is_sold: false).destroy_all
    @user.listings.where(is_sold: true).each do |listing|
      listing.update(user_id: admin_user.id)
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
