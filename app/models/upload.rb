require 'carrierwave/orm/activerecord'

class Upload < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = 'UploadAuthorizer'

  def self.build_upload(file)
    mime_type = `file --mime-type #{file.path}`.split(":").last.strip
    upload_type = descendants.find{|d| d.handles?(mime_type)} || UploadTypes::InvalidUpload
    upload_type.new(file: file)
  end

  def self.image_url_for(url)
    ext = File.extname(URI.parse(url).path).gsub('.','')
    upload_type = descendants.find{|d| d.handles?(ext)}
    if upload_type
      upload_type.image_url_for(url, ext)
    else
      ''
    end
  end

  def self.create_upload(file)
    build_upload(file).tap{|u| u.save!}
  end

  def self.handles?(mime_type_or_ext)
    UploadTypes.mimes_for(upload_type).include?(mime_type_or_ext) ||
      UploadTypes.extensions_for(upload_type).include?(mime_type_or_ext)
  end
end

Dir[File.dirname(__FILE__) + "/upload_types/*.rb"].each {|u| load u}