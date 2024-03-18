class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.total_price = params[:total_price]
    @order.user = current_user
    @order.save
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
  end

  def checkout
    @order = Order.find(params[:id])
    @order.update(status: :paid)
    redirect_to cart_path, notice: 'Order checked out successfully.'
  end


  def past
    # paid status of orders
    @orders = current_user.orders.where("created_at < ?", Time.now)
  end

end
