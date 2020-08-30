class CompanyMailer < ActionMailer::Base
  default from: "info@comicomi.cc"
  def received_email(company)
    @company = company
    mail to: "info@comicomi.cc"
    mail(subject: 'Comicomiに企業登録されました。') do |format|
      format.text
    end
  end

  def send_email(company)
    @company = company
    mail to: company.mail
    mail(subject: '人材紹介一括比較見積り『Comicomi』に参画頂きありがとうございます。') do |format|
      format.text
    end
  end

end
