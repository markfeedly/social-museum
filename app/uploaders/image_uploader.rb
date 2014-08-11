# encoding: utf-8

class ImageUploader < FileUploader
  def extension_white_list
    UploadTypes.extensions_for('Image')
  end
end
