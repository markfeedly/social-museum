require 'set' # needed? copied from old page
require 'uri' # needed? copied from old page
require 'sec-versioning'

class Page < ActiveRecord::Base
  extend FindBy
  include Authority::Abilities
  include Rakismet::Model
  include SecVersioning
  include Subscriptions
  include Titles
  include Tags
  include Categories
  include CategoryExtensions
  include Diff

  #todo belongs_to sometimes doesnt work - really, still?
  belongs_to :user
  belongs_to :creator, class_name: User
  belongs_to :last_editor, class_name: User

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

  #todo validates  :check_for_spam
  validates_associated :title
  after_create  :auto_subscribe_for_page_creation
  after_update  :auto_subscribe_user

  accepts_nested_attributes_for :title

  tracks_association :title
  tracks_association :tags
  tracks_association :categories
  #todo tracks_association :resources


  rakismet_attrs :author       => proc { User.find(user_id).name  },
                 :author_email => proc { User.find(user_id).email },
                 :user_role    => proc { User.find(user_id).admin? ? 'administrator' : 'user' },
                 :comment_type => proc { 'page' }

  # -------------------

  def check_for_spam
    puts 'check for spam ---------------'
    self.approved = true # !self.spam?
    #puts "page#check_for_spam approval #{self.approved}"
    true
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
