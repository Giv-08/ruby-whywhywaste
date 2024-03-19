class Restaurants::DashboardController < ApplicationController
  def dashboard
    @restaurant = Restaurant.find(current_restaurant.id)
    @unpublished_foods = @restaurant.foods.where(published: false)
    @published_foods = @restaurant.foods.where(published: true)
  end

  def notification
    @restaurant = Restaurant.find(current_restaurant.id)
  end
end
