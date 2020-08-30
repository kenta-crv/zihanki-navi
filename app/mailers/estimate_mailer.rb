class EstimateMailer < ActionMailer::Base
  default from: "info@comicomi.cc"
  def received_email(estimate)
    @estimate = estimate
    mail to: "info@comicomi.cc"
    mail(subject: '人材紹介一括比較見積り『Comicomi』より見積り依頼が届きました') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: '人材紹介一括比較見積り『Comicomi』にお問い合わせ頂きありがとうございます') do |format|
      format.text
    end
  end

  #def client_email(estimate)
  #  @estimate = estimate
  #  mail to: company.mail
  #  mail(subject: '弁護士一括比較見積り『士送隊』にお問い合わせ頂きありがとうございます') do |format|
  #    format.text
  #  end
  #end

end
