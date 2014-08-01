require 'set'
require 'uri'

class Page < ActiveRecord::Base
  include Rakismet::Model
  include Authority::Abilities
  self.authorizer_name = 'PageAuthorizer'

  include LinkedData

  has_many :history, class_name: 'PageState', dependent: :delete_all, autosave: true
  has_many :comments, dependent: :delete_all
  has_many :resource_usages
  has_many :resources, through: :resource_usages

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  rakismet_attrs :author       => proc { user.name  },
                 :author_email => proc { user.email }

  extend HistoryControl
  history_attr :content
  history_attr :user_id
  history_attr :user
  history_attr :categories
  history_attr :tags
  history_attr :item_number
  history_attr :location
  history_attr :title

  attr_readonly :slug

  before_validation :set_slug, on: :create
  after_create      :subscribe_creator

  validates :title,   presence: true, uniqueness: true
  validates :slug,    presence: true, uniqueness: true
  validates :content, presence: true
  validate  :not_spam?
  validate  :cat_link?
  validate  :tag_link?

  #---------------------------------------------------------

  def subscribe_creator
    subscribe(user)
  end

  def subscribe(usr)
    self.subscribers << usr unless self.subscribers.exists?(usr)
  end

  def unsubscribe(usr)
    self.subscribers -= [usr] if subscribed?(usr)
  end

  def subscribed?(usr)
    subscribers.exists?(usr)
  end

  #---------------------------------------------------------

  def self.find_with_category(cat)
    Page.order(:title).select{ |p| p.has_category?( cat ) ? p : nil}
  end

  def self.find_with_tag(tag)
    Page.order(:title).select{ |p| p.has_tag?( tag ) }
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

  def not_spam?
    if user.present?
      errors.add :content, I18n.t('errors.page.content.is_spam') if spam?
    else
      errors.add :content, I18n.t('errors.page.content.rakismet_skipped')
    end
    rescue
      errors.add :content, I18n.t('errors.page.content.rakismet_failed')
  end

  def tag_link?
    errors.add :tags, 'Links are not allowed as tags' unless (tags =~ %r{\A.*https?://.+(?:\.jpe?g|.gif|.png)?\z}i) == nil
  end

  def cat_link?
    errors.add :categories, 'Links are not allowed as categories' unless (categories =~ %r{\A.*https?://.+(?:\.jpe?g|.gif|.png)?\z}i) == nil
  end

  #---------------------------------------------------------
  # used when invoking diffy
  # or should be - it seems this is never called
  # TODO establish what is happening with this.
  def previous_content
    history.length == 1 ? nil : history[-2].content
  end

  def previous_title
    history.length == 1 ? nil : history[-2].title
    #history.length == 1 ? nil : history[-2].send("tidtle")
  end

  def previous_categories
    history.length == 1 ? nil : history[-2].categories
  end

  def previous_tags
    history.length == 1 ? nil : history[-2].tags
  end

  #---------------------------------------------------------

  def set_slug
    if slug.blank?
      title_as_slug = title.parameterize
      index = 0
      until Page.where(slug: title_as_slug) == []
        title_as_slug = "#{title.parameterize}" + "-#{index += 1}"
      end
      self.slug = title_as_slug
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