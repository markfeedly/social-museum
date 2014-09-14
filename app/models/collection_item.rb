require 'sec-versioning'
require 'subscription_management'

class CollectionItem < ActiveRecord::Base
  include Authority::Abilities
  include SecVersioning
  include SubscriptionManagement

  has_one :title,            as: :titleable,    dependent: :destroy, autosave: true
  has_many :comments,        as: :commentable,  dependent: :delete_all
  has_many :resource_usages, as: :resourceable
  has_many :resources,       through: :resource_usages
  has_many :subscriptions,   as: :subscribable, dependent: :delete_all
  has_many :subscribers,     through: :subscriptions, source: :user

  accepts_nested_attributes_for :title
  tracks_association :title

  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title

  after_create  :subscribe_creator

  #---------------------------------------------------------

  def name
    title.title
  end

  def to_param
    title.to_param
  end

  def categories_as_arr
    self.categories = '' unless self.categories
    self.categories == '' ? [] : self.categories.split(',').collect{|t| t.strip}
  end

  def tags_as_arr
    #todo remove kludge
    self.tags = '' unless self.tags
    self.tags == '' ? [] : self.tags.split(',').collect{|t| t.strip}
  end

  def slug
    self.title.slug
  end

# TO BE used in conflicting edits (maybe)
  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end

  #---------------------------------------------------------

  def self.find_by_slug(slug)
    joins(:title).where(titles: {slug: slug}).first
  end
end
