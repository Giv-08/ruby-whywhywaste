class OrderLinesController < ApplicationController
  # POST /foods/:food_id/order_lines
  def create
    # ORDER: need to find the existing cart (order) or create it if none
    @order = Order.find_or_create_by(user: current_user, status: :cart)
    # ORDER_LINE: initialize the order_line
    # set the quantity to 1
    @order_line = OrderLine.new(quantity: 1)
    # add the order to the order_line
    @order_line.order = @order
    # add the food to the order_line
    @food = Food.find(params[:food_id])
    @order_line.food = @food
    # save the order_line
    if @order_line.save
      redirect_to food_path(@food), notice: "Food added successfully to cart"
    else
      redirect_to food_path(@food), alert: "Something went wrong adding item to cart"
    end
  end
end
