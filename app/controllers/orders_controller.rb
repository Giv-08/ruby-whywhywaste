class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def checkout
    @order = Order.find(params[:id])
    @order.update(status: :paid)
    redirect_to past_orders_path, notice: 'Order checked out successfully.'
  end

  def past
    # paid status of orders
    @orders = current_user.orders.where(status: "paid").order(updated_at: :desc )
  end

end
