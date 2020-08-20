class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company #会社名
      t.string :first_name #代表者
      t.string :last_name #
      t.string :tel_front
      t.string :tel_middle
      t.string :tel_back
      t.string :fax_front
      t.string :fax_middle
      t.string :fax_back
      t.string :postnumber #郵便番号
      t.string :prefecture
      t.string :city
      t.string :town
      t.string :town_number
      t.string :building
      t.string :mail #URL
      t.string :url #URL
      t.string :usp #強み
      t.string :caption #資本金
      t.string :people #従業員数
      t.string :image

      t.string :foundation #設立日
      t.string :contact_url #問い合わせ　
      t.string :number_of_business #事業所数 →　n
      t.string :number_of_store #店舗数

      t.string :explanation #解説

      t.string :access #アクセス
      t.string :holiday #休日
      t.string :business_hour #営業時間
      t.string :price #価格

      t.references :admin
      t.references :user
      t.timestamps
    end
  end
end
