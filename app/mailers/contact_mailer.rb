class ContactMailer < ActionMailer::Base
  default from: "info@ri-plus.jp"
  def received_email(contact)
    @contact = contact
    mail to: "info@ri-plus.jp"
    mail(subject: 'コミコミよりお問い合わせがありました') do |format|
      format.text
    end
  end

  def send_email(contact)
    @contact = contact
    mail to: contact.email
    mail(subject: 'コミコミにお問い合わせ頂きありがとうございます') do |format|
      format.text
    end
  end

end
