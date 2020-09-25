class Estimate < ApplicationRecord
  attr_accessor :user_name
  attr_accessor :user_password

  belongs_to :user, optional: true
  has_many :messages, dependent: :nullify
  has_many :rooms, through: :messages

  #belongs_to :company
  validates :company, {presence: true}
  validates :name, {presence: true}  #名前
  validates :tel, {presence: true} #電話番号
  validates :email, {presence: true} #メールアドレス
  validates :address, {presence: true} #住所
  validates :prefecture, {presence: true} #都道府県コード
  validates :employment, {presence: true}
  validates :business, {presence: true}
  validates :people, {presence: true}
  validates :recruitment, {presence: true}
  validates :importance, {presence: true}
  validates :period, {presence: true}
  validates :choice, {presence: true}
end
