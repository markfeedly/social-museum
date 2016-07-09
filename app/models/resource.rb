require 'uri'
require 'sec-versioning'

class Resource < ActiveRecord::Base
  extend FindBy
  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'
  #todo include Rakismet::Model
  include SecVersioning
  include Subscriptions
  include Titles
  include Tags
  include Categories
  include CategoryExtensions
  include UploadHelper

  belongs_to :user
  belongs_to :creator, class_name: User
  belongs_to :last_editor, class_name: User

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

  default_scope {order('LOWER(name)')}

  accepts_nested_attributes_for :title
  accepts_nested_attributes_for :resource_usages, allow_destroy: true

  #tracks_association :resource_usages
  #tracks_association :user
  tracks_association :title
  tracks_association :tags
  tracks_association :categories
  #todo ? tracks_association :resourceables

  validates :title, presence: true
  #todo ? validates_associated :title
  #validates :source, presence: true
  #validates :url, presence: true, uniqueness: true
  #validate  :validate_url
  #validate  :validate_file

  after_create :sanetise_filenames
  #todo after_create :auto_subscribe_user
  #todo after_update :auto_subscribe_user

  alias_attribute :source, :url
  attr_accessor :slug

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

  def valid_filename?
    url[0] == '/'
  end

  def has_image_extension?
    url.match(/\.(jpe?g|gif|png)\z/) != nil
  end

  def valid_image_filename?
    valid_filename? && has_image_extension?
  end

  def valid_other_filename?
    valid_filename? && ! has_image_extension?
  end


  def file_type_id_and__name
    value_hash = {}
    value_hash[:type], value_hash[:id], value_hash[:name] = url.split('/')[1..3]
    value_hash
  end

  def valid_url?
    (url =~ URI::regexp(['http','https'])) == 0 #mvh commented || upload_exists?(url)
  end

  def valid_image_url?
    valid_url? && url.match(/\.(jpe?g|gif|png)\z/) != nil
  end

  def self.valid_image_url?(url)
    url =~ /\.(jpe?g|gif|png)\z/
  end

  def image_url
    Upload.image_url_for(url)
  end

  # validations ----------------------------------------------------------------------------------------

  def sanetise_filename(name)
    raise 'bad (empty) filename for upload' if name.empty?
    arr = name.split('.')
    raise "bad (no extension) in filename '#{name}' to upload" if arr.length == 1
    return name if arr.length == 2
    extension = arr.delete_at(-1)
    sanetised_base = arr.join('_')
    sanetised_base + '.' + extension
  end

  private

  def sanetise_filenames
    if url[0] == '/'
      sanetised_fn = sanetise_filename(url)
      File.rename(url, sanetised_fn)
      self.url = sanetised_fn
      url.gsub!(ENV['PUBLIC_UPLOAD_DIR'], '') if url[0] == '/'
      self.save
    end
  end

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
