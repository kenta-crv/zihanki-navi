class CompanyMailer < ActionMailer::Base
  default from: "info@shiokuritai.com"
  def received_email(company)
    @company = company
    mail to: "info@shiokuritai.com"
    mail(subject: '士送隊に企業登録されました。') do |format|
      format.text
    end
  end

  def send_email(company)
    @company = company
    mail to: company.mail
    mail(subject: '弁護士一括比較見積り『士送隊』に参画頂きありがとうございます。') do |format|
      format.text
    end
  end

end
