class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
      if @review.save
        flash[:notice] = 'Review Added Successfully'
        redirect_to @review.restaurant
      else
        flash[:alert] = "error!"
        render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.destroy
    if @review.destroy
      redirect_to restaurant_path(params[:restaurant_id])
    end
  end

  private
    def review_params

      params.require(:review).permit(:body, :rating)
      .merge(restaurant_id: params[:restaurant_id], user_id: current_user.id)
    end
end
