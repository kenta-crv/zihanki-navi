class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    #@company = Company.find(params[:id])
  end
end
