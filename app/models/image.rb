class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  attr_accessor :custom_filename

  def filename
    file.file.filename
  end
end
