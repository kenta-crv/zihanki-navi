class Company < ApplicationRecord
 belongs_to :member
 has_many :estimates
 validates :company, {presence: true}#会社名
 validates :first_name, {presence: true}#代表者
 validates :last_name, {presence: true}#
 validates :tel_front, {presence: true}
 validates :tel_middle, {presence: true}
 validates :tel_back, {presence: true}
 validates :postnumber, {presence: true}#郵便番号
 validates :prefecture, {presence: true}
 validates :city, {presence: true}
 validates :town, {presence: true}
 validates :town_number, {presence: true}
 validates :building, {presence: true}
 validates :mail, {presence: true}#URL
 #validates :usp, {presence: true}#強み
 #validates :people, {presence: true}#従業員数
 #validates :explanation, {presence: true}#解説
 #validates :access, {presence: true}#アクセス
 #validates :holiday, {presence: true}#休日
 #validates :business_hour, {presence: true}#営業時間

end
