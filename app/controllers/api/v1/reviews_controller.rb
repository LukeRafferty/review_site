class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    if Rails.env.test?
      data = params
    else
      data = JSON.parse(request.body.read)
    end

    review = Review.find(data["id"])

    if current_user.id == review["user_id"] || current_user.admin
      if Review.destroy(data["id"])
        render json: { result: "Review deleted successfully" }, adapter: :json
      else
        render json: { result: "Failed to delete review" }, adapter: :json
      end
    else
      render json: { result: "You do not have permission to delete this review" }, adapter: :json
    end
  end

end
