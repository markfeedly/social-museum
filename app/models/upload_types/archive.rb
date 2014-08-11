class UploadTypes::Archive < Upload
  mount_uploader :file, ArchiveUploader

  def self.upload_type
    'Archive'
  end

  def self.image_url_for(url, ext)
    'upload_placeholder_images/archive.png'
  end
end