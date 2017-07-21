class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    vote = Vote.create(review_id: params[:review_id], user_id: current_user.id, up_down: params[:up_down])
    render json: vote, adapter: :json
  end

end
