class Category < ActiveRecord::Base
  has_many :category_items
  has_many :categorised_items, through: :category_items, source: :categorisable
end