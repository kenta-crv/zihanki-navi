class AddColumnToEstimate3 < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :other, :string
  end
end
