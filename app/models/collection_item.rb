require 'sec-versioning'
require 'subscription_management'

class CollectionItem < ActiveRecord::Base
  include Authority::Abilities
  include Categories
  include SubscriptionManagement
  include SecVersioning

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
  tracks_association :tag_items
  tracks_association :category_items

  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title

  ############ after_create  :subscribe_creator

  #---------------------------------------------------------

=begin
  def categories_as_str
    self.categories.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end
=end

  def set_categories_from_string str
    desired_categories_as_strs = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    remove_categories(desired_categories_as_strs)
    add_categories(desired_categories_as_strs)
  end

  def remove_categories(desired_categories_as_strs)
    categories_to_remove = category_items.reject{ |c| desired_categories_as_strs.include?(c.category.name)  }
    self.category_items -= categories_to_remove  if categories.present? && categories_to_remove.present?
  end

  def add_categories(desired_categories_as_strs)
    existing_categories_as_strs = categories.collect{ |c|c.name }
    categories_to_add_as_strs = desired_categories_as_strs.reject { |c| existing_categories_as_strs.include?(c) }
    categories_to_add_as_strs.each do |c|
      existing_category = Category.where(name: c).first
      if existing_category
        category_items.create!(categorisable: self, category: existing_category)
      else
        self.categories << Category.new(name: c)
      end
    end
  end

=begin
  def tags_as_str
    self.tags.collect{|t| t.name}.join(', ')
  end
=end

  def set_tags_from_string str
    desired_tag_names = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    remove_tags(desired_tag_names)
    add_tags(desired_tag_names)
    #add_tags_or_categories(desired_tags_as_strs,     Tag,     tags,   tag_items )
  end

  def remove_tags(desired_tags_as_strs)
    tags_to_remove = tag_items.reject{ |tag_item| desired_tags_as_strs.include?(tag_item.tag.name)  }
    self.tag_items -= tags_to_remove  if tag_items.present? && tags_to_remove.present?
  end


  def add_tags(desired_tag_names)
    existing_tag_names = tags.collect{ |tag|tag.name}
    tag_names_to_add = desired_tag_names.reject { |t| existing_tag_names.include?(t) }
    tag_names_to_add.each do |t|
      a_tag = Tag.where(name: t).first
      if a_tag.present?
        tag_items.create!(tag: a_tag)
      else
        self.tags << Tag.new(name: t)
      end
    end
  end

  #----------------------------

=begin
  def add_tags_or_categories(desired_as_strs, d_class, d_attr, d_assoc )
    existing_desired_as_strs = d_attr.collect{ |d| d.name}
    desired_to_add_as_strs = desired_as_strs.reject { |d| existing_desired_as_strs.include?(d) }
    desired_to_add_as_strs.each do |d|
      existing_desired = d_class.where(name: d).first
      if existing_desired.present?
        d_assoc.create!(tag: existing_desired)
      else
        self.d_attr << d_class.new(name: d)
      end
    end
  end
=end

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
    self.tags.length == 0 ? [] : self.tags.collect{|t| t.name}
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
