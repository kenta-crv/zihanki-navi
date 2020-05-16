class List < ApplicationRecord
  mount_uploader :image, ImagesUploader

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      list = find_by(id: row["id"]) || new
      list.attributes = row.to_hash.slice(*updatable_attributes)
      list.save!
    end
  end

  def self.updatable_attributes
    ["company","name","tel","address","mail","url","url2","title","industry","other","other2","caption","people","image"]
  end
end
