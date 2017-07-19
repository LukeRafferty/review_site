class Api::V1::RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all, adapter: :json
  end

  def show
    render json: Restaurant.find(params[:id]), adapter: :json
  end
  
end
