class UploadTypes::Archive < Upload
  mount_uploader :file, ArchiveUploader

  def self.handles?(mime_type)
    UploadTypes.mimes_for('Archive').include?(mime_type)
  end
end