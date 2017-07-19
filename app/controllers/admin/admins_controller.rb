class Admin::AdminsController < ApplicationController

  def index
    if current_user.admin
      @validation = true
      render template: 'admins/index'
    else
      @validation = false

      render template: 'admins/index'

    end
  end
  
end
