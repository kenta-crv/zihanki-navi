class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :company #会社名
      t.string :name #代表者名
      t.string :tel #電話番号
      t.string :address #住所
      t.string :mail #メール
      t.string :url #URL
      t.string :url_2 #URL2
      t.string :title #タイトル
      t.string :industry #職種
      t.string :other
      t.string :other2
      t.string :caption #資本金
      t.string :people #従業員数
      t.string :image
      t.timestamps
    end
  end
end
