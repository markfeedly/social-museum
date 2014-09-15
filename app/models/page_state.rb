class PageState < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  belongs_to :page, touch: true
  belongs_to :user

  def categories=(new_categories)
    self['categories'] = clean(new_categories || '')
  end

  def tags=(new_tags)
    self['tags'] = clean(new_tags || '').downcase
  end

  def tags
    super || ''
  end

  def categories
    super || ''
  end

  def categories_as_array
    as_array(categories)
  end

  def tags_as_array
    as_array(tags)
  end

  def has_category?(cat)
    categories.include?(clean(cat))
  end

  def has_tag?(tag)
    tags.include?(clean(tag).downcase)
  end

  private

  def as_array(str)
    str.split(',')
  end

  def clean(input)
    input.split(',')
         .map(&:strip)
         .map{|elem| elem.gsub('\s+', ' ').gsub(/[^A-Za-z0-9_\- ]/, '').tr('_', '-')}
         .select(&:present?)
         .uniq.sort_by(&:downcase).join(',')
  end

end