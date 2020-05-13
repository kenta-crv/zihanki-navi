class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :store #店舗名
      t.string :evaluation
      t.string :url #URL
      t.string :tel #電話番号
      t.string :address #住所
      t.string :genre #ジャンル
      t.string :payment #支払方法
      t.string :genre #ジャンル
      t.string :payment #支払方法
      t.string :price_lunch #ランチ単価
      t.string :price_dinner #ディナー単価
      t.string :hour #営業時間
      t.string :holiday #定休日
      t.string :budget #予算
      t.string :price #料金
      t.string :difficulty #難易度
      t.string :bookking #予約方法
      t.string :sit
      t.string :open
      t.string :remarks #備考
      t.string :takeout
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :image_6
      t.string :image_7
      t.string :image_8
      t.string :image_9
      t.string :image_10
      t.timestamps
    end
  end
end
