class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def login
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

  def update_flag
    @user = User.find(params[:id])
    @user.update(seller: true)
    redirect_to user_path, notice: 'Account upgraded'
  end

  def signup
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
