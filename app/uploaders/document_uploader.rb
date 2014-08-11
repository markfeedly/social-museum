# encoding: utf-8

class DocumentUploader < FileUploader
  def extension_white_list
    UploadTypes.extensions_for('Document')
  end
end
