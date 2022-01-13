class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :title #タイトル
      t.string :kategory #カテゴリー
      t.string :description #
      t.string :heading_1 #見出し
      t.string :file_1 #ファイル
      t.text :content_1 #本文
      t.string :heading_2 #見出し
      t.string :file_2 #ファイル
      t.text :content_2 #本文
      t.string :heading_3 #見出し
      t.string :file_3 #ファイル
      t.text :content_3 #本文
      t.string :heading_4 #見出し
      t.string :file_4 #ファイル
      t.text :content_4 #本文
      t.string :heading_5 #見出し
      t.string :file_5 #ファイル
      t.text :content_5 #本文
      t.string :heading_6 #見出し
      t.string :file_6 #ファイル
      t.text :content_6 #本文
      t.string :heading_7 #見出し
      t.string :file_7 #ファイル
      t.text :content_7 #本文
      t.string :heading_8 #見出し
      t.string :file_8 #ファイル
      t.text :content_8 #本文
      t.string :heading_9 #見出し
      t.string :file_9 #ファイル
      t.text :content_9 #本文
      t.string :heading_10 #見出し
      t.string :file_10 #ファイル
      t.text :content_10 #本文
      t.string :heading_11
      t.string :file_11
      t.string :content_11
      t.string :heading_12
      t.string :file_12
      t.string :content_12
      t.string :heading_13
      t.string :file_13
      t.string :content_13
      t.string :heading_14
      t.string :file_14
      t.string :content_14
      t.string :heading_15
      t.string :file_15
      t.string :content_15
      t.string :heading_16
      t.string :file_16
      t.string :content_16
      t.string :heading_17
      t.string :file_17
      t.string :content_17
      t.string :heading_18
      t.string :file_18
      t.string :content_18
      t.string :heading_19
      t.string :file_19
      t.string :content_19
      t.string :heading_20
      t.string :file_20
      t.string :content_20
      t.timestamps
    end
  end
end
