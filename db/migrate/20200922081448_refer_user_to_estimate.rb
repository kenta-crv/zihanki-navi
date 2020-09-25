class ReferUserToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :user_id, :integer, after: :remarks
    add_column :estimates, :choice, :string #派遣紹介セレクト
  end
end
