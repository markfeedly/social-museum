class UploadTypes::Image < Upload
  mount_uploader :file, ImageUploader

  def self.upload_type
    'Image'
  end

  def self.image_url_for(url, ext)
    url
  end
end