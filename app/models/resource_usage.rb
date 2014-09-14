class ResourceUsage < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  belongs_to :resource

  def page_title
    resourceable.try(:title)
  end

  def page_title=(page_title)
    if resourceable.class == 'Page'
      self.resourceable = Page.joins(:page_title).where(titles: {title: page_title}).first
    end
  end
end
