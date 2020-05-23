class Contact < ApplicationRecord

validates :company, {presence: true} #会社名
validates :company, {presence: true} #会社名
validates :name, {presence: true}  #代表者名
validates :tel, {presence: true} #電話番号
validates :address, {presence: true} #住所
validates :email, {presence: true} #メールアドレス
validates :prefecture, {presence: true} #県
validates :business, {presence: true} #業種
validates :people, {presence: true} #必要人数
validates :period, {presence: true} #期間

@@SubsidyLists = [
  ["キャリアアップ助成金","キャリアアップ助成金"],
  ["人材開発支援等助成金","人材開発支援等助成金"],
  ["トライアル雇用助成金","トライアル雇用助成金"],
  ["人材確保支援等助成金","人材確保支援等助成金"],
  ["両立支援等助成金","両立支援等助成金"],
  ["小規模事業者持続化補助金","小規模事業者持続化補助金"],
  ["ものづくり補助金","ものづくり補助金"],
  ["IT導入支援補助金","IT導入支援補助金"]
]

def self.SubsidyLists
  @@SubsidyLists
end
end
