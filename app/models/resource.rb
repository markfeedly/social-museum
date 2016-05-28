require 'uri'
require 'sec-versioning'
#todo require 'subscription_management'

class Resource < ActiveRecord::Base
  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'
  #todo include Rakismet::Model
  include SecVersioning
  #todo include SubscriptionManagement
  include Titles
  include Tags
  include Categories
  include CategoryExtensions
  include UploadHelper

  has_one  :title,           as: :titleable,    dependent: :destroy, autosave: true
  has_many :comments,        as: :commentable,  dependent: :delete_all

  has_many :subscriptions,   as: :subscribable, dependent: :delete_all
  has_many :subscribers,     through: :subscriptions, source: :user

  has_many :tag_items,       as: :taggable, dependent: :delete_all
  has_many :tags,            through: :tag_items

  has_many :category_items,  as: :categorisable, dependent: :delete_all
  has_many :categories,      through: :category_items

  has_many :resource_usages
  def resourceables; resource_usages.map(&:resourceable); end

  belongs_to :user

  #scope    :ordered_by_title, ->{joins(:page_title).order("titles.title")}

  accepts_nested_attributes_for :title
  accepts_nested_attributes_for :resource_usages, allow_destroy: true


  tracks_association :resource_usages
  #tracks_association :user
  tracks_association :title
  tracks_association :tag_items
  tracks_association :category_items
  #todo ? tracks_association :resources

  #todo ? validates_associated :title
  #--
  validates :title, presence: true
  #validates :source, presence: true
  #validates :url, presence: true, uniqueness: true
  #validate  :validate_url
  #validate  :validate_file

  alias_attribute :source, :url

  #todo after_create  :subscribe_creator

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

  def self.valid_image_url?(url)
    url =~ /\.(jpe?g|gif|png)\z/
  end

  def image_url
    Upload.image_url_for(url)
  end

  # misc -----------------------------------------------------------------------------------------

# TO BE used in conflicting edits (maybe)
  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end

  # finding ----------------------------------------------------------------------------------------

  def self.find_by_slug(slug)
    joins(:title).where(titles: {slug: slug}).first
  end

  def self.find_by_title(title)
    joins(:title).where(titles: {title: title}).first
  end

  # validations ----------------------------------------------------------------------------------------

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
