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

  def client_email(estimate)
    @estimate = estimate
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: '人材紹介一括比較見積り『Comicomi』より見積り依頼が届きました') do |format|
      format.text
    end
  end

  def regist_user(user)
    @user = user
    mail to: @user.email
    mail(subject: '人材紹介一括比較見積り『Comicomi』に会員登録頂きありがとう御座います') do |format|
      format.text
    end
  end
end
