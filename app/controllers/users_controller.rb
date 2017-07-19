class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    username = User.find(params[:id])["username"]
    User.find(params[:id]).update_attributes(admin: true)
    flash[:admin] = "#{username} is now an admin!"
    redirect_to '/admin'
  end

end
# user_signed_in?
# current_user
# user_session
