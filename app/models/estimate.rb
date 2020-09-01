class Estimate < ApplicationRecord
  #belongs_to :company
  validates :company, {presence: true}
  validates :name, {presence: true}  #名前
  validates :tel, {presence: true} #電話番号
  validates :email, {presence: true} #メールアドレス
  validates :address, {presence: true}
  validates :prefecture, {presence: true}
  validates :employment, {presence: true}
  validates :business, {presence: true}
  validates :people, {presence: true}
  validates :recruitment, {presence: true}
  validates :importance, {presence: true}
  validates :period, {presence: true}
end
