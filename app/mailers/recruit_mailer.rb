class RecruitMailer < ActionMailer::Base
  default from: "info@ri-plus.jp"
  default to: "info@ri-plus.jp"

  def received_email(recruit)
    @recruit = recruit
    mail(subject: '求人応募が届きました') do |format|
      format.text
    end
  end

end
