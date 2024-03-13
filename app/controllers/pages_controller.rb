class PagesController < ApplicationController
  skip_before_action :authenticate_user_or_restaurant, only: [ :home ]

  def dashboard
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:food_id])
  end

  def show
    @restaurants = Restaurant.all
    @foods = Food.all
  end
end
