class OrderLinesController < ApplicationController
  # POST /foods/:food_id/order_lines
  def create
    @food = Food.find(params[:food_id])
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # ORDER: need to find the existing cart (order) or create it if none
    @order = Order.find_or_create_by(user: current_user, status: :cart)
    @order.restaurant = @food.restaurant
    @order.save
    # ORDER_LINE: initialize the order_line
    # Check if exisiting order_line for this food
    # set the quantity to 1
    @order_line = OrderLine.find_by(order: @order, food: @food) || OrderLine.new(order: @order, food: @food, quantity: 0)
    # add the order to the order_line
    @order_line.quantity += 1
    # save the order_line
    if @order_line.save
      redirect_to cart_path, notice: "Food added successfully to cart"
    else
      redirect_back fallback_path: food_path(@food), alert: "Something went wrong adding item to cart"
    end
  end

  def add_quantity
    @order_line = OrderLine.find(params[:id])
    @food_id = @order_line.food_id
    @food = Food.find(@food_id)
    @food_quantity = @food.quantity
    if @food_quantity > @order_line.quantity
      @order_line.quantity += 1
      @order_line.save
      redirect_to cart_path
    else
      redirect_to cart_path, alert: "you have reached the maximum quantity limit"
    end
  end

  def reduce_quantity
    @order_lines = OrderLine.find(params[:id])
    if @order_lines.quantity > 1
      @order_lines.quantity -= 1
    end
    @order_lines.save
    redirect_to cart_path
  end

  def destroy
    @order_line = OrderLine.find(params[:id])
    @order_line.destroy
    redirect_to cart_path, status: :see_other
  end

end
