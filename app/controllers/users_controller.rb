class UsersController < ApplicationController
  before_action :authenticate_user!
end
# user_signed_in?
# current_user
# user_session