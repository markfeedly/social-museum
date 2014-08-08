require 'ostruct'
class UploadTypes::InvalidUpload
  def initialize(*args)
  end

  def save!
    raise "Unknown file type"
  end

  def file
    OpenStruct.new(url: '')
  end
end