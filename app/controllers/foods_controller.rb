class FoodsController < ApplicationController
  def index
    # @foods = Food.all
    if current_restaurant.present?
      @unpublished_foods = Food.where(published: false)
      @my_restaurant = current_restaurant
      @foods = @unpublished_foods
    elsif user_signed_in?
      @restaurant = Restaurant.find(params[:restaurant_id])
      @foods = @restaurant.foods.where(published: true)
    else
      redirect_to select_restaurant_path, notice: "You are not signed-in"
    end
  end

  # def index
  #   if current_restaurant.present?
  #     @my_restaurant = current_restaurant
  #     @foods = @my_restaurant.foods
  #     @unpublished_foods = @my_restaurant.foods.where(published: false)
  #   else

  #     redirect_to select_restaurant_path,
  #   end
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new(food_params)
    @food.restaurant = @restaurant
    @food.restaurant = @restaurant
    if @food.save
      redirect_to restaurant_foods_path, notice: "food created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def published
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
    @food.update(published: true)
    redirect_to foods_path
  end

  def unpublished
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
    @food.update(published: false)
    redirect_to restaurants_dashboard_path
  end

  def show
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
    @restaurant = @food.restaurant
  end

  # patch /foods/:id
  def update
    @food = Food.find(params[:id])
    @restaurant = @food.restaurant
    @food.update(food_params)
    # redirect_to restaurant_path(@restaurant)
    respond_to do |format|
      format.html { redirect_to restaurant_foods_path(@restaurant) }
      format.json { render json: @food.to_json }
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @restaurant = @food.restaurant
    @food.destroy
    # redirect_to restaurant_path(@restaurant), status: :see_other
    redirect_to restaurant_foods_path(@restaurant), status: :see_other
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :description, :allergen, :quantity, :restaurant_id, :user_id, :photo, :published, :bestseller)
  end
end
