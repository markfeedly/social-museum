require 'carrierwave/orm/activerecord'

class Upload < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = 'UploadAuthorizer'

  def self.build_upload(file)
    mime_type = `file --mime-type #{file.path}`.split(":").last.strip
    binding.pry
    upload_type = descendants.find{|d| d.handles?(mime_type)} || UploadTypes::InvalidUpload
    upload_type.new(file: file)
  end

  def self.create_upload(file)
    build_upload(file).tap{|u| u.save!}
  end
end

Dir[File.dirname(__FILE__) + "/upload_types/*.rb"].each {|u| load u}