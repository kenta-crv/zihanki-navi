class CreateLps < ActiveRecord::Migration[5.2]
  def change
    create_table :lps do |t|
      t.string :name
      t.string :trouble_1
      t.string :trouble_2
      t.string :trouble_3
      t.timestamps
    end
  end
end
