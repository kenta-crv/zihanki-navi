class LpsController < ApplicationController
before_action :authenticate_admin!, except: [:index, :show]
  def index
    @lps = Lp.order(created_at: "DESC").page(params[:page])
  end

  def show
    @lp = Lp.find(params[:id])
  end

  def new
    @lp = Lp.new
  end

  def create
    @lp = Lp.new(lp_params)
    if @lp.save
      redirect_to lps_path
    else
      render 'new'
    end
  end

  def edit
    @lp = Lp.find(params[:id])
  end

  def destroy
    @lp = Lp.find(params[:id])
    @lp.destroy
     redirect_to lps_path
  end

  def update
    @lp = Lp.find(params[:id])
    if @lp.update(lp_params)
      redirect_to lps_path
    else
      render 'edit'
    end
  end

  private
  def lp_params
    params.require(:lp).permit(
      :name,
      :trouble_1,
      :trouble_2,
      :trouble_3
      )
  end
end
