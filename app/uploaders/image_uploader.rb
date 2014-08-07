# encoding: utf-8

class ImageUploader < FileUploader
  def extension_white_list
    %w{png jpg jpeg gif}
  end
end
