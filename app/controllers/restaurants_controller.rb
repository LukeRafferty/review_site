class RestaurantsController < ApplicationController

  def index
    if valid_search_params
      #if the search bar is used, try to bring the user to a show page
      @restaurant = Restaurant.search(params[:search]).order("created_at DESC").first
      if @restaurant
        #take the user to the show page
        redirect_to restaurant_path(@restaurant)
      else
        #navigate to the index page with flash alert
        flash[:alert] = "No results for '#{params[:search]}'"
        @restaurants = Restaurant.all.order("created_at DESC")
      end
    else
      #navigate directly to the index page
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

  def valid_search_params
    params[:search] &&
    params[:search] != "" &&
    params[:search] != " " &&
    params[:search].length > 1
  end

end
