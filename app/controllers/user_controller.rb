class UserController < ApplicationController
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
    @user = User.new
  end

  def signup
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
