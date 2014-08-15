class CollectionItem < ActiveRecord::Base
  include Authority::Abilities

  has_one :title, as: :titleable, dependent: :destroy, autosave: true
  validates :item_number, presence: true, uniqueness: true
  validates :location, presence: true
  validates_associated :title
  accepts_nested_attributes_for :title

  def name
    title.title
  end

  def to_param
    title.to_param
  end

  def self.find_by_slug(slug)
    joins(:title).where(titles: {slug: slug}).first
  end
end
