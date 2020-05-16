class ContactController < ApplicationController
  def index
    @contact = Contact.new
    render :action => 'index'
  end

  def confirm
    @contact = Contact.new(contact_params)
    #@contact.subsidy = params[:contact][:subsidy]
    if @contact.valid?
      render :action =>  'confirm'
    else
      render :action => 'index'
    end
    # binding.pry
  end

  def thanks
    @contact = Contact.new(contact_params)
    ContactMailer.received_email(@contact).deliver
    ContactMailer.send_email(@contact).deliver
  end

  private
  def contact_params
    params.require(:contact).permit(
      :company, #会社名
      :name,  #代表者名
      :tel, #電話番号
      :address, #住所
      :email, #メールアドレス
      :url, #URL
      :prefecture, #県
      :business, #業種
      :people, #必要人数
      :introduction, #導入時期
      :period, #期間
      :communication, #連絡方法
      :country, #国籍
      :estimate, #比較者数
      :remarks #備考
    )
  end
end
