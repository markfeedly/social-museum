class Category < ActiveRecord::Base
  #todo is include CategoryExtensions needed?
  include CategoryExtensions
  extend CategoryClassExtensions

  has_many :category_items

  has_many :collection_items, through: :category_items, source: :categorisable, source_type: 'CollectionItem'
  has_many :pages, through: :category_items, source: :categorisable, source_type: 'Page'
  has_many :resources, through: :category_items, source: :categorisable, source_type: 'Resource'

  before_destroy {collection_items.clear; pages.clear}
end


