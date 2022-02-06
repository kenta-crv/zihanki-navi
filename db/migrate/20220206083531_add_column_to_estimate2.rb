class AddColumnToEstimate2 < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :vender, :string
  end
end
