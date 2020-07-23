class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name  #苗字
      t.string :last_name  #名前
      t.string :first_kana  #ミョウジ
      t.string :last_kana  #ナマエ
      t.string :tel #電話番号
      t.string :email #メールアドレス
      t.string :prefecture #都道府県
      t.string :city #市区町村
      t.string :town #URL
      t.string :build #建物
      t.string :area #面積
      t.string :introduction #解体時期
      t.string :remarks #その他
      t.timestamps
    end
  end
end
