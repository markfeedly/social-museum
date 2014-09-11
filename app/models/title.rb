class Title < ActiveRecord::Base
  has_secretary on: ["title"]

  belongs_to :titleable, polymorphic: true

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  attr_readonly :slug

  before_validation :set_slug, on: :create
  before_validation :title_strip

  def set_slug
    if slug.blank?
      new_slug = title.parameterize
      t = self.class.arel_table
      slug_count = self.class.where(t[:slug].matches("#{new_slug}-%")).count

      new_slug += "-#{slug_count}" unless slug_count.zero?
      self.slug = new_slug
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

  def self.exists?(t)
    Title.where(title: t) != []
  end

  private

  def title_strip
    self.title.strip!
  end
end