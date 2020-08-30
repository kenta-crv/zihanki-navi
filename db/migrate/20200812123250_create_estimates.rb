class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :company  #会社名
      t.string :name  #名前
      t.string :tel #電話番号
      t.string :email #メールアドレス
      t.string :address #住所
      t.string :recruitment #募集
      t.string :period #時期
      t.string :remarks #相談内容
      t.references :company

      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.timestamps
    end
  end
end
