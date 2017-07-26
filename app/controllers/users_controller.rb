class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end
end
# user_signed_in?
# current_user
# user_session
