# encoding: utf-8

class ArchiveUploader < FileUploader
  def extension_white_list
    UploadTypes.extensions_for('Archive')
  end
end
