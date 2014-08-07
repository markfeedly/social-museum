class UploadTypes::Image < Upload
  mount_uploader :file, ImageUploader

  def self.handles?(mime_type)
    mime_type =~ /^image\//
  end
end