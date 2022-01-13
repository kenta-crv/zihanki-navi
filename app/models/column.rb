class Column < ApplicationRecord
  DELETE_TEXT_1 = "Powered by"
  DELETE_TEXT_2 = "Froala Editor"
  DELETE_TEXT_3 = "<p><></p>"
  mount_uploader :file_1, ImagesUploader
  mount_uploader :file_2, ImagesUploader
  mount_uploader :file_3, ImagesUploader
  mount_uploader :file_4, ImagesUploader
  mount_uploader :file_5, ImagesUploader
  mount_uploader :file_6, ImagesUploader
  mount_uploader :file_7, ImagesUploader
  mount_uploader :file_8, ImagesUploader
  mount_uploader :file_9, ImagesUploader
  mount_uploader :file_10, ImagesUploader
  mount_uploader :file_11, ImagesUploader
  mount_uploader :file_12, ImagesUploader
  mount_uploader :file_13, ImagesUploader
  mount_uploader :file_14, ImagesUploader
  mount_uploader :file_15, ImagesUploader
  mount_uploader :file_16, ImagesUploader
  mount_uploader :file_17, ImagesUploader
  mount_uploader :file_18, ImagesUploader
  mount_uploader :file_19, ImagesUploader
  mount_uploader :file_20, ImagesUploader

 def to_meta_tags
 {
   title: title,
   description: description
 }
 end

 def display_content_1
   self.content_1.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_2
   self.content_2.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_3
   self.content_3.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_4
   self.content_4.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_5
   self.content_5.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_6
   self.content_6.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_7
   self.content_7.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_8
   self.content_8.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_9
   self.content_9.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_10
   self.content_10.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_11
   self.content_11.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_12
   self.content_12.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_13
   self.content_13.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_14
   self.content_14.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_15
   self.content_15.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_16
   self.content_16.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_17
   self.content_17.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_18
   self.content_18.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_19
   self.content_19.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_content_20
   self.content_20.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_1
   self.heading_1.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_2
   self.heading_2.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_3
   self.heading_3.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_4
   self.heading_4.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_5
   self.heading_5.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_6
   self.heading_6.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_7
   self.heading_7.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_8
   self.heading_8.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_9
   self.heading_9.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_10
   self.heading_10.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_11
   self.heading_11.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_12
   self.heading_12.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_13
   self.heading_13.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_14
   self.heading_14.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_15
   self.heading_15.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_16
   self.heading_16.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_17
   self.heading_17.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_18
   self.heading_18.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_19
   self.heading_19.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end
 def display_heading_20
   self.heading_20.delete(DELETE_TEXT_1).delete(DELETE_TEXT_2)
 end

 @@kategory_status = [
   ["自販機コラム","自販機コラム"],
   ["面接・採用","面接・採用"],
   ["自販機コラム","自販機コラム"],
 ]
 def self.KategoryStatus
   @@kategory_status
 end
end
