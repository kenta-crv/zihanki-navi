class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :rogo, :string #アイコン
    add_column :companies, :president_first_name, :string #代表者名
    add_column :companies, :president_last_name, :string #代表者名
    add_column :companies, :choice, :string #派遣・紹介・両方
    add_column :companies, :profile, :string #プロフィール
    add_column :companies, :bisiness, :string #事業内容
    add_column :companies, :performance, :string #実績
    add_column :companies, :specialty, :string #得意業界
  end
end
