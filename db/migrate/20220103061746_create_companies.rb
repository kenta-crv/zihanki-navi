class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company #会社名
      t.string :name #代表者
      t.string :tel
      t.string :address
      t.string :mail #URL
      t.string :remarks #備考
      t.timestamps
    end
  end
end
