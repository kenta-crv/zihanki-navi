class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @admin = Admin.find(params[:id])
    @rooms = Room.active
  end
end
