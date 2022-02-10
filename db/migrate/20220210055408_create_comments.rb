class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :estimate, foreign_key: true
      t.string :asahi
      t.string :cocacola
      t.string :dydo
      t.string :itoen
      t.string :kirin
      t.string :otsuka
      t.timestamps
    end
  end
end
