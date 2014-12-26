require 'sec-versioning'
require 'subscription_management'

class CollectionItem < ActiveRecord::Base
  include Authority::Abilities
  include Categories
  include SecVersioning
  include SubscriptionManagement

  has_one  :title,           as: :titleable,    dependent: :destroy, autosave: true
  has_many :comments,        as: :commentable,  dependent: :delete_all
  has_many :resource_usages, as: :resourceable
  has_many :resources,       through: :resource_usages
  has_many :subscriptions,   as: :subscribable, dependent: :delete_all
  has_many :subscribers,     through: :subscriptions, source: :user
  has_many :tag_items,       as: :taggable
  has_many :tags,            through: :tag_items
  has_many :category_items,  as: :categorisable
  has_many :categories,      through: :category_items


  accepts_nested_attributes_for :title
  tracks_association :title
  tracks_association :tags
  tracks_association :categories

  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title

  ############ after_create  :subscribe_creator

  #---------------------------------------------------------

  def categories_as_str
    self.categories.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end

  def set_categories_from_string str
    desired_categories_as_strs = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    remove_categories(desired_categories_as_strs)
    add_categories(desired_categories_as_strs)
  end

  def remove_categories(desired_categories_as_strs)
    categories_to_remove = categories.reject{ |c| desired_categories_as_strs.include?(c.name)  }
    self.categories -= categories_to_remove  if categories && categories_to_remove
  end

  def add_categories(desired_categories_as_strs)
    existing_categories_as_strs = categories.collect{ |c|c.name }
    categories_to_add_as_strs = desired_categories_as_strs.reject { |c| existing_categories_as_strs.include?(c) }
    categories_to_add_as_strs.each do |c|
      existing_category = Category.where(name: c).first
      if existing_category
        CategoryItem.create!(taggable: self, tag: existing_category)
      else
        self.categories += [Category.new(name: c)]
      end
    end
  end

  def tags_as_str
    self.tags.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end

  def set_tags_from_string str
    desired_tags_as_strs = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    remove_tags(desired_tags_as_strs)
    add_tags(desired_tags_as_strs)
  end

  def remove_tags(desired_tags_as_strs)
    tags_to_remove = tags.reject{ |tag| desired_tags_as_strs.include?(tag.name)  }
    self.tags -= tags_to_remove  if tags && tags_to_remove
  end

  def add_tags(desired_tags_as_strs)
    existing_tags_as_strs = tags.collect{ |tag|tag.name}
    tags_to_add_as_strs = desired_tags_as_strs.reject { |t| existing_tags_as_strs.include?(t) }
    tags_to_add_as_strs.each do |t|
      existing_tag = Tag.where(name: t).first
      if existing_tag
        TagItem.create!(taggable: self, tag: existing_tag)
      else
        self.tags += [Tag.new(name: t)]
      end
    end
  end

  # ----------------------------------------------------------------------------

  def name
    title.title
  end

  def hacky_title
    title.title
  end

  def to_param
    title.to_param
  end

  def categories_as_arr
    self.categories.length == 0 ? [] : self.categories.collect{|t| t.name.strip}
  end

  def has_tag?(tag)
    tags_as_arr.include?(tag)
  end

  def tags_as_arr
    self.tags.length == 0 ? [] : self.tags.collect{|t| t.name.strip}
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

  def self.find_by_title(title)
    joins(:title).where(titles: {title: title}).first
  end
end
