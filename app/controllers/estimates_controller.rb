class EstimatesController < ApplicationController
  before_action :authenticate_member!, only: [:apply, :confirm_point]
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]
  # before_action :authenticate_user!, only: [:new, :confirm, :thanks]

  def index
    @estimates = Estimate.order(created_at: "DESC").page(params[:page])
  end

  def new
    @estimate = Estimate.new
  end

  def confirm
    @estimate = Estimate.new(estimate_params)
    render :new if @estimate.invalid? || invalid_user || double_email
  end

  def thanks
    @estimate = Estimate.new(estimate_params)
    create_user if current_user.blank?
    @estimate.user_id = current_user.id
    @estimate.save
    #EstimateMailer.received_email(@estimate).deliver
    #EstimateMailer.client_email(@estimate).deliver
    #EstimateMailer.send_email(@estimate).deliver
    EstimateMailer.received_email(@estimate).deliver # 管理者に通知
    EstimateMailer.send_email(@estimate).deliver # 送信者に通知
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
    redirect_to estimates_path, alert:"削除しました"
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(estimate_params)
      redirect_to estimates_path(@estimate), alert: "更新しました"
    else
      render 'edit'
    end
  end

  def send_mail
    @estimate = Estimate.find(params[:id])
    @estimate.update(send_mail_flag: true)
    EstimateMailer.client_email(@estimate).deliver # 全企業に送信
    redirect_to estimate_path(@estimate), alert: "送信しました"
  end

  def confirm_point
    @estimate = Estimate.find(params[:id])
    room = @estimate.rooms.find_by(member_id: current_member.id)

    if room.present?
      # 既に応募済の場合
      return redirect_to room_messages_path(uri_token: room.uri_token)
    end
  end

  def apply
    estimate = Estimate.find(params[:id])
    room = estimate.rooms.find_by(member_id: current_member.id)

    if room.blank?
      # 初めての場合
      if current_member.point >= 10
        # ポイントを減らす
        current_member.update(point: current_member.point - 10)
        room = Room.get_room_in(estimate.user, current_member)
        content = "会社名: #{estimate.co} \n担当者名: #{estimate.name} \n電話番号: #{estimate.tel} \nメールアドレス: #{estimate.email} \n住所: #{estimate.address} \n従業員数: #{estimate.employment} \n募集職種: #{estimate.business} \n重要な点: #{estimate.importance} \n募集人材: #{estimate.recruitment} \n必要人数: #{estimate.people} \n必要時期: #{estimate.period} \n相談内容: #{estimate.remarks}"
        Message.create(is_user: true, room_id: room.id, content: content, estimate_id: estimate.id)
        redirect_to room_messages_path(uri_token: room.uri_token), alert: "10ポイント消費しました"
      else
        redirect_to member_path(current_member), alert: "ポイントが足りません"
      end
    else
      # 既に応募済の場合
      redirect_to room_messages_path(uri_token: room.uri_token)
    end
  end

  def recruit
    @estimates = Estimate.order(created_at: "DESC").where(send_mail_flag: "送信済").page(params[:page])
  end

  private
  def estimate_params
    params.require(:estimate).permit(
      :co,
      :company,  #会社名
      :name,  #名前
      :tel, #電話番号
      :email, #メールアドレス
      :prefecture, #募集エリア
      :address, #住所
      :area, #募集エリア
      :employment, #従業員数
      :business,
      :people, #必要人数
      :recruitment, #必要人材
      :importance, #重要な点
      :period, #時期
      :remarks, #その他希望
      :choice,
      :word,
      :user_name,
      :user_password,
    )
  end

  def invalid_user
    # userがいるか
    if current_user
      return false
    end
    # nameが入っているか
    if estimate_params[:user_name].blank?
      return true
    end
    # passwordが入っているか
    if estimate_params[:user_password].blank?
      return true
    end
    return false
  end

  def double_email
    # userがいるか
    if current_user
      return false
    end
    # 同じメールアドレスの人がいるか
    user = User.find_by(email: estimate_params[:email])
    if user.present?
      return true
    end
    return false
  end

  def create_user
    user = User.create(
      user_name: estimate_params[:user_name],
      password: estimate_params[:user_password],
      email: estimate_params[:email],
      confirmed_at: Time.current
    )
    EstimateMailer.regist_user(user).deliver
    sign_in user
  end
end
