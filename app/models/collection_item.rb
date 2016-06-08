require 'sec-versioning'

class CollectionItem < ActiveRecord::Base
  extend FindBy
  include Authority::Abilities
  include Rakismet::Model
  include SecVersioning
  include Subscriptions
  include Titles
  include Tags
  include Categories
  include CategoryExtensions

  belongs_to :user
  belongs_to :creator, class_name:  User
  belongs_to :last_editor, class_name:  User

  has_one  :title,           as: :titleable,    dependent: :destroy, autosave: true
  has_many :comments,        as: :commentable,  dependent: :delete_all

  has_many :resource_usages, as: :resourceable
  has_many :resources,       through: :resource_usages

  has_many :subscriptions,   as: :subscribable, dependent: :delete_all
  has_many :subscribers,     through: :subscriptions, source: :user

  has_many :tag_items,       as: :taggable, dependent: :delete_all
  has_many :tags,            through: :tag_items

  has_many :category_items,  as: :categorisable, dependent: :delete_all
  has_many :categories,      through: :category_items

  default_scope {order('LOWER(name)')}

  #todo rakismet validate
  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title

  after_create  :auto_subscribe_user
  after_update  :auto_subscribe_user

  accepts_nested_attributes_for :title

  tracks_association :title
  tracks_association :tag_items
  tracks_association :category_items
  #todo tracks_association :resources - any more?


end
