class UploadTypes::Image < Upload
  mount_uploader :file, ImageUploader

  def self.handles?(mime_type)
    UploadTypes.mimes_for('Image').include?(mime_type)
  end
end