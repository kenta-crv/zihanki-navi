class AddColumnToEstimate4 < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :word, :string
  end
end
