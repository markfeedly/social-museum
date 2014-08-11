class UploadTypes::Document < Upload
  mount_uploader :file, DocumentUploader

  def self.upload_type
    'Document'
  end

  def self.image_url_for(url, ext)
    'upload_placeholder_images/doc.png'
  end
end
