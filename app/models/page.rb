require 'set' # needed? copied from old page
require 'uri' # needed? copied from old page
require 'sec-versioning'
require 'subscription_management'

class Page < ActiveRecord::Base
  include Authority::Abilities
  include Rakismet::Model
  include SecVersioning
  include SubscriptionManagement
  include Tags
  include Categories

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

  scope    :ordered_by_title, ->{joins(:page_title).order("titles.title")}

  accepts_nested_attributes_for :title

  tracks_association :title
  tracks_association :tag_items
  tracks_association :category_items
  tracks_association :resources

  validates_associated :title
  validate  :not_spam? if ENV['WORDPRESS_KEY'] != nil

  ############ after_create  :subscribe_creator

  rakismet_attrs :author       => proc { user.name  },
                 :author_email => proc { user.email },
                 :user_role    => proc { user.admin? ? 'administrator' : 'user' },
                 :comment_type => proc { 'page' }

  # misc -----------------------------------------------------------------------------------------

  def title
    title.title
  end

  def hacky_title
    title.title
  end

  def to_param
    title.to_param
  end

  def slug
    self.title.slug
  end

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

  def not_spam?
    if user.present?
      errors.add :content, I18n.t('errors.page.content.is_spam') if spam?
    else
      errors.add :content, I18n.t('errors.page.content.rakismet_skipped')
    end
  rescue
    errors.add :content, I18n.t('errors.page.content.rakismet_failed')
  end

end
