require 'uri'
require 'carrierwave/orm/activerecord'

class Resource < ActiveRecord::Base
  has_secretary

  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'

  mount_uploader :image, ImageUploader

  has_many :resource_usages
  has_many :pages, through: :resource_usages

  belongs_to :user

  tracks_association :pages
  tracks_association :user

  validates :title, uniqueness: true, presence: true
  validate :validate_source

  def source
    return url unless url.empty?
    return image_url.to_s if image_url
  end

  private

  def validate_source
    if url !~ URI::regexp(['http','https']) && image.blank?
      errors.add :url, 'one of file or URL should be set as the resource source'
    end

    if !url.empty? && image
      errors.add :url, 'Only one resource may be set'
    end
  end
end
