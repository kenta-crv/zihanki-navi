class ChangeColumnToComment2 < ActiveRecord::Migration[5.2]
  def change
    remove_index :comments, :estimate_id
    add_index :comments, :estimate_id, unique: true
  end
end
