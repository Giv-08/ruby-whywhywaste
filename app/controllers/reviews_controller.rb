class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:food_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to reviews_path_, notice: "review created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:content, :restaurant_id, :user_id)
  end
end
