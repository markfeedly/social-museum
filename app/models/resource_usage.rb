class ResourceUsage < ActiveRecord::Base
  belongs_to :page
  belongs_to :resource

  def page_title
    page.try(:title)
  end

  def page_title=(page_title)
    self.page = Page.joins(:page_title).where(titles: {title: page_title}).first
  end
end
