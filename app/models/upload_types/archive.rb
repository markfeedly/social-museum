class UploadTypes::Archive < Upload
  mount_uploader :file, ArchiveUploader

  def self.handles?(mime_type)

  end
end