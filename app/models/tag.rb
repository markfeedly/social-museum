class Tag < ActiveRecord::Base
  has_many :tag_items
  has_many :tagged_items, through: :tag_items, source: :taggable
end