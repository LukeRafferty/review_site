require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters


   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      admin_status = false
      if params["user"]
        if params["user"]["admin"] == "1"
          admin_status = true
        end
      end
     user_params.permit(:username, :email, :password, :password_confirmation)
     .merge(admin: admin_status)
   end
 end
end
