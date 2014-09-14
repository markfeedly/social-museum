require 'uri'

class Resource < ActiveRecord::Base
  has_secretary

  include Authority::Abilities
  include UploadHelper
  self.authorizer_name = 'ResourceAuthorizer'

  has_many :resource_usages
  def resourceables; resource_usages.map(&:resourceable); end

  accepts_nested_attributes_for :resource_usages, allow_destroy: true

  belongs_to :user

  tracks_association :resource_usages
  #tracks_association :user

  validates :title, presence: true
  validates :source, presence: true
  validates :url, presence: true, uniqueness: true
  validate  :validate_url
  validate  :validate_file

  alias_attribute :source, :url

  def file
    @upload
  end

  def file=(new_file)
    if new_file.present?
      begin
        @upload =  Upload.create_upload(new_file)
        self.url = @upload.file.url
      rescue
        @upload_error = true
      end
    end
  end

  def valid_url?
    url =~ URI::regexp(['http','https']) || upload_exists?(url)
  end

  def valid_image_url?
    valid_url? && url =~ /\.(jpe?g|gif|png)\z/
  end

  def image_url
    Upload.image_url_for(url)
  end

  def resource_usages_attributes=(new_resource_usages)
    new_resource_usages.reject!{|_, r| r['page_title'] == ''}
    seen_title = []
    deduped_new_resource_usages = new_resource_usages.reject{|_, v| v['_destroy'] == 'false' &&
                                    seen_title.include?(v['page_title']).tap{seen_title << v['page_title']}}
    deduped_existing_to_set = deduped_new_resource_usages.reject{|_, v| v['_destroy'] == 'false' &&
                                    !Title.exists?(v['page_title']) }
    super(deduped_existing_to_set)
  end

  private

  def validate_url
    if !valid_url? && !@upload_error
      errors.add :url, 'URL should be a valid link'
    end
  end

  def validate_file
    if @upload_error
      errors.add :file, 'Could not upload file'
      errors.add :url, 'Could not upload file'
    end
  end
end