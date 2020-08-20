class List < ApplicationRecord
  mount_uploader :image, ImagesUploader

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      list = find_by(id: row["id"]) || new
      list.attributes = row.to_hash.slice(*updatable_attributes)
      list.save!
    end
  end

  def self.updatable_attributes
    ["company", #会社名
    "first_name", #代表者
    "last_name",
    "tel_front",
    "tel_middle",
    "tel_back",
    "fax_front",
    "fax_middle",
    "fax_back",
    "postnumber", #郵便番号
    "prefecture",
    "city",
    "town",
    "town_number",
    "building",
    "mail", #URL
    "url", #URL
    "usp", #強み
    "caption", #資本金
    "people", #従業員数
    "image",

    "foundation", #設立日
    "contact_url", #問い合わせ　
    "number_of_business", #事業所数 →　n
    "number_of_store", #店舗数

    "explanation", #解説

    "access", #アクセス
    "holiday", #休日
    "business_hour", #営業時間
    "price" #価格
  ]
  end
end
