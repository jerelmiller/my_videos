class Video < ActiveRecord::Base
  validates :name, presence: true
  validates :file, presence: true
  # TODO: Validate file size
  # validates :avatar, file_size: { less_than: 2.gigabytes }
  # https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Validate-attachment-file-size

  before_destroy :remove_file

  mount_uploader :file, FileUploader
end
