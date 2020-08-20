class ApplicationController < ActionController::Base
  #private
  def after_sign_in_path_for(resource)
    case resource
    when User
      "/" #ユーザー登録と相談を兼ねる
    when Admin
      "/" #先々一覧を見れるアナリティクスへ
    when Member
      "/companies/new"
    else
      "/"
    end
  end

  #UserとStaffがありログアウト画面に推移
  def after_sign_out_path_for(resource)
    case resource
    when User, :user, :users
      "/"
    when Admin, :admin, :admins
      "/"
    when Member, :member, :members
      "/"
    else
       super
    end
  end
end
