require 'sec-versioning'
require 'subscription_management'

class CollectionItem < ActiveRecord::Base
  include Authority::Abilities
  include SubscriptionManagement
  include SecVersioning
  include Categories
  include CategoryExtensions

  has_one  :title,           as: :titleable,    dependent: :destroy, autosave: true
  has_many :comments,        as: :commentable,  dependent: :delete_all

  has_many :resource_usages, as: :resourceable
  has_many :resources,       through: :resource_usages

  has_many :subscriptions,   as: :subscribable, dependent: :delete_all
  has_many :subscribers,     through: :subscriptions, source: :user

  has_many :tag_items,       as: :taggable
  has_many :tags,            through: :tag_items

  has_many :category_items,  as: :categorisable, dependent: :delete_all
  has_many :categories,      through: :category_items
  before_destroy {category_items.clear}

  accepts_nested_attributes_for :title
  tracks_association :title
  tracks_association :tag_items
  tracks_association :category_items

  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title

  ############ after_create  :subscribe_creator

   # tags -----------------------------------------------------------------------------------------


  def set_tags_from_string str
    new_tag_names = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    remove_tags(new_tag_names)
   add_tags(new_tag_names)
  end

  def remove_tags(new_tag_names)
    tag_names_to_remove = tag_items.reject{ |tag_item| new_tag_names.include?(tag_item.tag.name)  }
    self.tag_items -= tag_names_to_remove  if tag_items.present? && tag_names_to_remove.present?
  end


  def add_tags(new_tag_names)
    old_tag_names = tags.collect{|t| t.name}
    tag_names_to_add = new_tag_names.reject { |t| old_tag_names.include?(t) }
    tag_names_to_add.each do |t|
      a_tag = Tag.where(name: t).first
      if a_tag.present?
        tag_items.create!(tag: a_tag)
      else
        self.tags << Tag.new(name: t)
      end
    end
  end

  def has_tag?(tag)
    tags_as_arr.include?(tag)
  end

  def tags_as_arr
    self.tags.length == 0 ? [] : self.tags.collect{|t| t.name}
  end

  def tags_as_str
    self.tags.collect{|t| t.name}.join(', ')
  end

  # misc -----------------------------------------------------------------------------------------

  def name
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
end
