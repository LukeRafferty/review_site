class Admin::AdminsController < ApplicationController

  def index
    render template: 'admins/index'
  end

end
