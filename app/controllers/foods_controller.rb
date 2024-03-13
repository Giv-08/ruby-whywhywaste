class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new(food_params)
    # @food.status = "pending"
    @food.restaurant = @restaurant
    # @food.user = current_user
    @food.restaurant = @restaurant
    if @food.save
      redirect_to restaurants_path, notice: "food created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
  end

  # patch /foods/:id
  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to restaurant_food_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, status: :see_other
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :description, :allergen, :quantity, :restaurant_id, :user_id)
  end
end
