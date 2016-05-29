class Tag < ActiveRecord::Base
  has_many :tag_items

  has_many :collection_items, through: :tag_items, source: :taggable, source_type: 'CollectionItem'
  has_many :pages, through: :tag_items, source: :taggable, source_type: 'Page'
  has_many :resources, through: :tag_items, source: :taggable, source_type: 'Resource'


  before_destroy {collection_items.clear; pages.clear}
end