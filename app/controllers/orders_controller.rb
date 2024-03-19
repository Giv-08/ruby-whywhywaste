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
     @orders = current_user.orders.where(status: "paid")

    # mock_orders = [
    #   { id: 1, total_price: 50.00, user_id: current_user.id, restaurant_id: 1, created_at: Time.now - 10.days },
    #   { id: 2, total_price: 75.00, user_id: current_user.id, restaurant_id: 2, created_at: Time.now - 5.days },
    #   { id: 3, total_price: 60.00, user_id: current_user.id, restaurant_id: 1, created_at: Time.now - 3.days }
    # ]

    # Assign mock_orders to @orders
    # @orders = mock_orders.map { |attributes| Order.new(attributes) }
  end
end
