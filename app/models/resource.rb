require 'uri'

class Resource < ActiveRecord::Base
  has_secretary

  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'

  has_many :resource_usages
  has_many :pages, through: :resource_usages

  belongs_to :user

  tracks_association :pages
  tracks_association :user

  validates :title, uniqueness: true, presence: true
  validate :validate_source

  def source
    url || file
  end

  private

  def validate_source
    if url !~ URI::regexp(['http','https']) && file.blank?
      errors.add :url, 'one of file or URL should be set as the resource source'
    end
  end
end
