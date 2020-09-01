class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :company  #会社名
      t.string :name  #名前
      t.string :tel #電話番号
      t.string :email #メールアドレス
      t.string :address #住所
      t.string :prefecture
      t.string :employment #従業員数
      t.string :business #募集職種
      t.string :importance #重要な点
      t.string :recruitment
      t.string :people
      t.string :period #時期
      t.string :remarks #相談内容
      t.references :company
      t.timestamps
    end
  end
end
