class Video < ActiveRecord::Base
  validates :name, presence: true
  validates :file, presence: true

end  mount_uploader :file, FileUploader
