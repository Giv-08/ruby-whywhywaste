class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new
    @review = @restaurant.reviews.build
  end

  def create
    # @review.user = current_user
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.user = current_user
    # @restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "review created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:content, :restaurant_id, :user_id)
  end
end
