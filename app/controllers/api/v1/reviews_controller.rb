class Api::V1::ReviewsController < ApplicationController
  def destroy

    review = Review.destroy(params[:id])
    render json: review, adapter: :json
  end
end
