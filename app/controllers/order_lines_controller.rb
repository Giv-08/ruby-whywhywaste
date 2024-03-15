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

  def add_quantity
    @order_line = OrderLine.find(params[:id])
    @order_line.quantity += 1
    # if @order_line.quantity < # total stock
    @order_line.save
    redirect_to cart_path
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

  # def show

  # end
end
