class Tag < ActiveRecord::Base
  has_many :tag_items
  has_many :collection_items, through: :tag_items, source: :taggable, source_type: 'CollectionItem'
  has_many :pages, through: :tag_items, source: :taggable, source_type: 'Page'

  before_destroy {collection_items.clear; pages.clear}
end