class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  #this is an unconventional method - it creates AND updates
  def create

    #to make testing and development work
    data = nil
    if Rails.env.development? || Rails.env.production?
      data = JSON.parse(request.body.read)
    else
      data = params
    end


    #check if the vote already exists
    existing_vote = Vote.find_by(user_id: current_user.id, review_id: data[:review_id])

    if existing_vote
      #if it does, update the vote's up_down value
      existing_vote.update_attributes(up_down: data[:up_down])
      render json: existing_vote, adapter: :json
    else
      #otherwise, create a new vote
      vote = Vote.new(review_id: data[:review_id], user_id: current_user.id, up_down: data[:up_down])
      if vote.save
        render json: vote, adapter: :json
      else
        render json: vote.errors, adapter: :json
      end
    end
  end

end
