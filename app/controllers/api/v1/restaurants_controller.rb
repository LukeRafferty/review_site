class Api::V1::RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all, adapter: :json
  end

  def show
    #only return the reviews
    reviews = Restaurant.find(params[:id]).reviews
    render json: reviews, adapter: :json
  end

end
