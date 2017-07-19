class Api::V1::RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all, adapter: :json
  end
end
