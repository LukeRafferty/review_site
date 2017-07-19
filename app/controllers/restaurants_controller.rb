class RestaurantsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to @restaurant
      else
        render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(name: params[:name], address: params[:address], city: params[:city], state: params[:state], zip_code: params[:zip_code], description: params[:description])
    redirect_to restaurant_path(@restaurant)
  end

  def delete
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code, :description)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
