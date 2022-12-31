class AddColumnToComment3 < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :body, :string
  end
end
