class ContactMailer < ActionMailer::Base
  default from: "info@comicomi.cc"
  def received_email(contact)
    @contact = contact
    mail to: "info@comicomi.cc"
    mail(subject: '『Comicomi』よりお問い合わせがありました') do |format|
      format.text
    end
  end

  def send_email(contact)
    @contact = contact
    mail to: contact.email
    mail(subject: '『Comicomi』にお問い合わせ頂きありがとうございます') do |format|
      format.text
    end
  end

end
