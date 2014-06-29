require 'set'

class Page < ActiveRecord::Base
  include Authority::Abilities
  self.authorizer_name = 'PageAuthorizer'

  include LinkedData

  has_many :history, class_name: 'PageState', dependent: :delete_all, autosave: true
  has_many :comments, dependent: :delete_all
  has_many :resource_usages
  has_many :resources, through: :resource_usages

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  extend HistoryControl
  history_attr :content
  history_attr :user
  history_attr :categories
  history_attr :tags
  history_attr :item_number
  history_attr :location
  history_attr :title

  attr_readonly :slug

  before_validation :set_slug, on: :create
  after_create :subscribe_creator

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :slug, uniqueness: true

  #---------------------------------------------------------

  def subscribe_creator
    subscribe(user)
  end

  def subscribe(usr)
    self.subscribers << usr unless self.subscribers.exists?(usr)
  end

  def unsubscribe(usr)
    subscribers.exists?(usr)
    self.subscribers -= [usr]
  end

  #---------------------------------------------------------

  def self.find_with_category(cat)
    Page.order(:title).select{ |p| p.has_category?( cat ) ? p : nil}
  end

  def self.find_with_tag(tag)
    Page.order(:title).select{ |p| p.has_tag?( tag ) }
  end

  def self.find_by_title(t)
    Page.where(title: t).first
  end

  def self.find_by_prioritisation(p)
    Page.where(moscow: p)
  end

  #---------------------------------------------------------

  def has_category?(c)
    history.last.try(:has_category?, c)
  end

  def has_page_type?(t)
    page_type == t
  end

  def has_tag?(t)
    history.last.try(:has_tag?, t)
  end

  #---------------------------------------------------------

  # used when invoking diffy
  def previous_content
    history.length == 1 ? nil : history[-2].content
  end
  def previous_title
    history.length == 1 ? nil : history[-2].title
  end
  def previous_categories
    history.length == 1 ? nil : history[-2].categories
  end
  def previous_tags
    history.length == 1 ? nil : history[-2].tags
  end

  #------------------------------------------------------------------

  def set_slug
    if slug.blank?
      self.slug = title.parameterize
    end
  end

  def slug=(new_slug)
    if self[:slug].blank?
      super
    end
  end

  def to_param
    slug
  end

end