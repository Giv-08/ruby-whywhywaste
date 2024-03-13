class PagesController < ApplicationController
  skip_before_action :authenticate_user_or_restaurant, only: [ :home, :authentication ]

  # def dashboard
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @food = Food.find(params[:food_id])
  # end

  def show
    @restaurants = Restaurant.all
    @foods = Food.all
  end

  def authentication
    # sign_in for both buttons
    # sign_up for both buttons
    render layout: 'no_navbar'
  end

end
