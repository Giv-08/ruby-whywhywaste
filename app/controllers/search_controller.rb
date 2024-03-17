class SearchController < ApplicationController
  # GET /search?query=asian
  def list
    # Get all the restaurants that match search query
  end

  # GET /search/map?query=asian
  def map
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
      }
    end
  end
end
