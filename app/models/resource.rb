class Resource < ActiveRecord::Base
  has_secretary

  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'

  has_many :resource_usages
  has_many :pages, through: :resource_usages

  belongs_to :user

  tracks_association :pages
  tracks_association :user

  # Delete appropriate line depending on whether titles must be unique
  # for resources
  validates :title, presence: {allow_blank: false }
  #validates :title, uniqueness: true, presence: {allow_blank: false }
  validate :source_ok?

  def source
    url || file
  end

  private

  def source_ok?
    self.url = nil if url == ''
    self.file = nil if file == ''

    ret = (url && !file) || (!url && file)
    errors.add :url, 'one of file or URL should be set as the resource source' unless ret
    ret
  end
end
