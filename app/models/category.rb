class Category < ActiveRecord::Base
  has_many :category_items
  has_many :collection_items, through: :category_items, source: :categorisable, source_type: 'CollectionItem'
  has_many :pages, through: :category_items, source: :categorisable, source_type: 'Page'

  before_destroy {collection_items.clear; pages.clear}
end


