class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :co #会社名
      t.string :name  #名前
      t.string :tel #電話番号
      t.string :email #メールアドレス
      t.string :postnumber #郵便番号
      t.string :address #住所
      t.string :installation #設置箇所
      t.string :people #屋内の場合、使用が想定される人数
      t.string :chenge #自販機交換か
      t.string :change_before #交換前自販機
      t.string :importance #重要な点
      t.string :period #設置希望時期
      t.string :remarks #要望
      t.timestamps
    end
  end
end
