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
end
