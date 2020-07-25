class Contact < ApplicationRecord

validates :first_name, {presence: true}  #苗字
validates :last_name, {presence: true}  #名前
validates :first_kana, {presence: true}  #ミョウジ
validates :last_kana, {presence: true}  #ナマエ
validates :tel, {presence: true} #電話番号
validates :email, {presence: true} #メールアドレス
validates :prefecture, {presence: true} #都道府県
validates :city, {presence: true} #市区町村
validates :town, {presence: true} #URL
validates :worries, {presence: true} #建物
validates :importance, {presence: true} #面積
validates :period, {presence: true} #解体時期
validates :remarks, {presence: true} #解体時期
end
