class CategoryItem < ActiveRecord::Base
  belongs_to :categorisable, polymorphic: true
  belongs_to :category

end