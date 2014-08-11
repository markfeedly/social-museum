class UploadTypes::Document < Upload
  mount_uploader :file, DocumentUploader

  def self.handles?(mime_type)
    UploadTypes.mimes_for('Document').include?(mime_type)
  end
end
