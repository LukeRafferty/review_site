class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
    @rating_collection = Review::RATINGS
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.create(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
      if @review.save
        redirect_to @restaurant
      else
        @rating_collection = Review::RATINGS
        render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(body: params[:body], rating: params[:rating])
    redirect_to review_path(@review)
  end

  def delete

  end

private
  def review_params
    params.require(:review).permit(:rating, :body).merge(restaurant: Restaurant.find(params[:restaurant_id]))
  end

end
