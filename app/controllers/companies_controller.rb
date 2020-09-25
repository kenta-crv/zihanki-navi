class CompaniesController < ApplicationController
before_action :authenticate_member!, except: :index
before_action :authenticate_admin!, only: :index

  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result
    @companies = @companies.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    return redirect_to :root, alert: "企業情報は作成されています" if current_member.company.present?
    @company = Company.new(member_id: current_member.id)
  end

  def create
    return redirect_to :root, alert: "企業情報は作成されています" if current_member.company.present?
    @company = Company.new(company_params)
    @company.member_id = current_member.id
    if params[:back]
      render new_company_path
    elsif @company.save
      render thanks_companies_path
    else
      render new_company_path
    end
  end

  def edit
    @company = Company.find_by(member_id: current_member.id)
    #@company.member_id = current_member.id
  end

  def update
    @company = Company.find(params[:id])
    @company.member_id = current_member.id
    if @company.update(company_params)
        redirect_to "/members/#{current_member.id}"
    else
        render 'edit'
    end
  end

  def confirm
   @company = Company.new(company_params)
   @company.member_id = current_member.id
   render :new if @company.invalid?
  end

  def thanks
   @company = Company.new(company_params)
   CompanyMailer.received_email(@company).deliver
   CompanyMailer.send_email(@company).deliver
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
 # ポイントの料金を変更するときはここを書き換える
  @pay_arr = [
   {
     payment: 85000,
     point: 110
   },
   {
     payment: 45000,
     point: 50
   },
   {
     payment: 28500,
     point: 30
   },
   {
     payment: 10000,
     point: 10
   }
  ]
 end

  def get_point
   get_point = current_member.point + params[:point].to_i
   current_member.update(point: get_point)
   return
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
    :mail, #メールアドレス
    :url, #URL
    :usp, #強み
    :people, #従業員数
    :image, #担当者名
    :foundation, #設立日

    #:explanation, #解説

    :rogo, #アイコン
    :president_first_name, #代表者名
    :president_last_name, #代表者名
    :choice, #派遣・紹介・両方
    :profile, #プロフィール
    #:bisiness, #事業内容
    :performance, #実績
    :specialty, #得意業界

    :access, #アクセス
    :holiday, #休日
    :business_hour #営業時間
  )
  end
end
