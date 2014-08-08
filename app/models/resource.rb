require 'uri'

class Resource < ActiveRecord::Base
  has_secretary

  include Authority::Abilities
  include UploadHelper
  self.authorizer_name = 'ResourceAuthorizer'

  has_many :resource_usages
  has_many :pages, through: :resource_usages

  belongs_to :user

  tracks_association :pages
  tracks_association :user

  validates :title, uniqueness: true, presence: true
  validates :source, presence: true
  validate  :validate_url

  alias_attribute :source, :url

  def file
    @upload
  end

  def file=(new_file)
    if new_file.present?
      @upload =  Upload.create_upload(new_file)
      self.url = @upload.file.url
    end
  end

  def valid_url?
    url =~ URI::regexp(['http','https']) || upload_exists?(url)
  end

  def valid_image_url?
    valid_url? && url =~ /\.(jpe?g|gif|png)\z/
  end

  private

  def validate_url
    if !valid_url?
      errors.add :url, 'URL should be a valid link'
    end
  end
end