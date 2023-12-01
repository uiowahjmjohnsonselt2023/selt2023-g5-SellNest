class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @orders = current_user.orders
  end
end