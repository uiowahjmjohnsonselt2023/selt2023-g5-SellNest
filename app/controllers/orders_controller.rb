class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @orders = current_user.orders
  end

  def refund
    @order = Order.find(params[:id])
    @order.update(status: 'refunded')

    redirect_to admin_path, notice: 'Order refunded successfully.'
  end

end