module UploadHelper
  def upload_exists?(path)
    Upload.any?{|u|u.file.url == path}
  end
end