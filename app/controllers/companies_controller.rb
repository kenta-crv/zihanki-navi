class CompaniesController < ApplicationController
before_action :authenticate_user!, except: :index

  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result
    @companies = @companies.page(params[:page]).per(20).order(created_at: :desc)
  end

  def new
    @company = Company.new
  end

  def confirm
    @company = Company.new(company_params)
    render :new if @company.invalid?
  end

  def thanks
    @company = Company.new(company_params)
    CompanyMailer.received_email(@company).deliver
    CompanyMailer.send_email(@company).deliver
  end

  def create
    @company = Company.new(company_params)
    render :new and return if params[:back] || !@company.save
    redirect_to thanks_companies_path
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

 def update
    @company = Company.find(params[:id])
     if @company.update(company_params)
        redirect_to companies_path
    else
        render 'edit'
    end
 end

 def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
 end

 def import
   Company.import(params[:file])
   redirect_to root_url, notice:"リストを追加しました"
 end

 def pay
 end

private
 def company_params
  params.require(:company).permit(
    :company, #会社名
    :first_name, #代表者
    :last_name, #
    :tel_front,
    :tel_middle,
    :tel_back,
    :fax_front,
    :fax_middle,
    :fax_back,
    :postnumber, #郵便番号
    :prefecture,
    :city,
    :town,
    :town_number,
    :building,
    :mail, #URL
    :url, #URL
    :usp, #強み
    :caption, #資本金
    :people, #従業員数
    :image,

    :foundation, #設立日
    :contact_url, #問い合わせ　
    :number_of_business, #事業所数 →　n
    :number_of_store, #店舗数

    :explanation, #解説

    :access, #アクセス
    :holiday, #休日
    :business_hour, #営業時間
    :price #価格

    )
  end
end
