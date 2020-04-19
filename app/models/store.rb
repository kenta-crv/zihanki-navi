class Store < ApplicationRecord
  mount_uploader :image_1, ImagesUploader
  mount_uploader :image_2, ImagesUploader
  mount_uploader :image_3, ImagesUploader
  mount_uploader :image_4, ImagesUploader
  mount_uploader :image_5, ImagesUploader
  mount_uploader :image_6, ImagesUploader
  mount_uploader :image_7, ImagesUploader
  mount_uploader :image_8, ImagesUploader
  mount_uploader :image_9, ImagesUploader
  mount_uploader :image_10, ImagesUploader

  def self.import(file)
      CSV.foreach(file.path, headers:true) do |row|
       store = find_by(id: row["id"]) || new
       store.attributes = row.to_hash.slice(*updatable_attributes)
       next if self.where(tel: store.tel).count > 0
       store.save!
      end
  end

  def self.updatable_attributes
    ["store","evaluation","tel","address","genre","payment","genre","payment","price_lunch","price_dinner","hour","holiday","budget","price","difficulty","bookking","remarks"]
  end
end
