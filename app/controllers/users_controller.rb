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
    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    else
      redirect_to root_path, alert: "User remains undeleted :/"
    end

  end
end
# user_signed_in?
# current_user
# user_session
