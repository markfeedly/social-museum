class ResourceUsage < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  belongs_to :resource

  def page_title
    name = resourceable.try(:name)
    if name
      typ = resourceable_type == 'Page' ? 'p' : 'c'
      res = typ == 'p' ? Page.find(resourceable_id) : CollectionItem.find(resourceable_id)
      res_id = res.id.to_s
    end
    name ?  name + " {#{typ}#{res_id}}" : ''
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
