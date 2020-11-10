class RenameCompanyColumnToEstimates < ActiveRecord::Migration[5.2]
  def change
    rename_column :estimates, :company, :co
  end
end
