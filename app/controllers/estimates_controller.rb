class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.order(created_at: "DESC").page(params[:page])
  end

  def new
    @estimate = Estimate.new
  end

  def confirm
    @estimate = Estimate.new(estimate_params)
    render :new if @estimate.invalid?
  end

  def thanks
    @estimate = Estimate.new(estimate_params)
    EstimateMailer.received_email(@estimate).deliver
    #EstimateMailer.client_email(@estimate).deliver
    EstimateMailer.send_email(@estimate).deliver
  end

  def create
    @estimate = Estimate.new(estimate_params)
    render :new and return if params[:back] || !@estimate.save
    redirect_to thanks_estimates_path
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def destroy
    @estimate = Estimate.find(params[:id])
    @estimate.destroy
     redirect_to estimates_path
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(estimate_params)
      redirect_to estimates_path
    else
      render 'edit'
    end
  end

  private
  def estimate_params
    params.require(:estimate).permit(
      :company,  #会社名
      :name,  #名前
      :tel, #電話番号
      :email, #メールアドレス
      :address, #住所
      :prefecture, #募集エリア
      :employment, #従業員数
      :business,
      :people, #必要人数
      :recruitment, #必要人材
      :importance, #重要な点
      :period, #時期
      :remarks #その他希望
    )
  end
end
