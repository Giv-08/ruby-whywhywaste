class Restaurants::DashboardController < ApplicationController
  def dashboard
    @restaurant = Restaurant.find(current_restaurant.id)
  end

  def notification
    @restaurant = Restaurant.find(current_restaurant.id)
  end
end
