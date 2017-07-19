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
    # @post = Post.find(params[:id])
    #  @post.update(title: params[:title], description: params[:description])
    #  redirect_to post_path(@post)
  end

  def delete

  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code :description)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
