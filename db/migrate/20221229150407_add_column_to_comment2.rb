class AddColumnToComment2 < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :yamakyu, :string
    add_column :comments, :neos, :string
  end
end
