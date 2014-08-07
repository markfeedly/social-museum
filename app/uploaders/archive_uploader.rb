# encoding: utf-8

class ArchiveUploader < FileUploader
  def extension_white_list
    %w(zip rar 7z tar.gzip)
  end
end
