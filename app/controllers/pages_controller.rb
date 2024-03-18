class PagesController < ApplicationController
  skip_before_action :authenticate_user_or_restaurant, only: [ :home, :authentication ]


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
