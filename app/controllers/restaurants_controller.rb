class RestaurantsController < ApplicationController
  # before_action :authorize_user, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      @restaurants = Restaurant.all.order("created_at DESC")
    end
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
        flash[:notice] = 'Restaurant Added Successfully'
        redirect_to @restaurant
      else
        flash[:alert] = "error!"
        render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    if @restaurant.destroy
      redirect_to restaurants_path, notice: "Restaurant was successfully deleted"
    else
      render @restaurant, alert: "The restaurant was not deleted"
    end
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code, :description)
  end

  # def authorize_user
  #   if !user_signed_in? || !current_user.admin?
  #     raise ActionController::RoutingError.new("Not Found")
  #   end
  # end

end
