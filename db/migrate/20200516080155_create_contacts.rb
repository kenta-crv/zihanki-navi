class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :company #会社名
      t.string :name  #代表者名
      t.string :tel #電話番号
      t.string :address #住所
      t.string :email #メールアドレス
      t.string :url #URL
      t.string :prefecture #県
      t.string :business #業種
      t.string :people #必要人数
      t.string :introduction #導入時期
      t.string :period #期間
      t.string :communication #連絡方法
      t.string :country #国籍
      t.string :estimate #比較者数
      t.string :remarks #備考
      t.timestamps
    end
  end
end
