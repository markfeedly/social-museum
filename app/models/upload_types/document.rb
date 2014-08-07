class UploadTypes::Document < Upload
  mount_uploader :file, DocumentUploader

  def self.handles?(mime_type)
    mime_type =~ /^text\//
  end
end