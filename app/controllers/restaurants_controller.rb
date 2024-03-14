class RestaurantsController < ApplicationController
  def index
    # Signed-in restaurant only
    if restaurant_signed_in?
      @my_restaurant = current_restaurant

      # fetch all other restaurants (excluding signed-in restaurant)
      @other_restaurants = Restaurant.where.not(id: @my_restaurant&.id)
    else
      # fetches all restaurants
      @my_restaurant = nil
      @other_restaurants = Restaurant.all

      render 'restaurant_card', restaurant: @my_restaurant
    end
    # Grab all foods from signed-in restaurant
    @foods = Food.all
  end


  # def index
  #   if current_user&.restaurant?
  #     # Signed-in restaurant only
  #     if restaurant_signed_in?
  #       @my_restaurant = current_restaurant

  #       # fetch all other restaurants (excluding signed-in restaurant)
  #       @other_restaurants = Restaurant.where.not(id: @my_restaurant&.id)
  #       render 'restaurants/index_for_restaurant'
  #     else
  #       # fetches all restaurants
  #       @my_restaurant = nil
  #       @other_restaurants = Restaurant.all
  #       render 'restaurants/index_for_restaurant'
  #     end
  #   else
  #     render 'restaurants/index_for_customer'




  def show
    @restaurant = Restaurant.find(params[:id])
    # @food = Food.find(params[:id])
    @foods = @restaurant.foods
  end

  # def create
  #   @restaurant = Restaurant.new(restaurant_params)
  #   @restaurant.user = current_user
  #   if @restaurant.save
  #     redirect_to restaurants_path_, notice: "Restaurant created successfully"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  #   @restaurant = Restaurant.find(params[:id])
  # end

  # def new
  #   @restaurant = Restaurant.new
  #   @restaurant.save
  # end

  # def update
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(restaurant_params)
  #   # redirect_to dashboard_path
  # end

  # def destroy
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.destroy
  #   redirect_to restaurants_path, status: :see_other
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :phone_no, :email, :rating, :pickup_start, :pickup_end, :latitude, :longitude )
  end
end
