class Video < ActiveRecord::Base
  validates :name, presence: true
  validates :file, presence: true

  before_destroy :remove_file

  mount_uploader :file, FileUploader

  private

  def remove_file
    FileUtils.rm_rf("#{Rails.root}/public/uploads/video/#{file.mounted_as}/#{id}")
  end
end
