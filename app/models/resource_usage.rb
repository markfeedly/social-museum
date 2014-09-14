class ResourceUsage < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  belongs_to :resource

  def page_title
    # KLUDGE
    if resourceable.class == CollectionItem
      t=resourceable.try(:title)
      t.title
    else
      resourceable.try(:title)
    end
  end

  def page_title=(page_title)
    if resourceable.class == 'Page'
      self.resourceable = Page.joins(:page_title).where(titles: {title: page_title}).first
    else
      # VERY EXPERIMENTAL, UN-PROOFED
      self.resourceable = CollectionItem.joins(:title).where(titles: {title: page_title}).first
    end
  end
end
