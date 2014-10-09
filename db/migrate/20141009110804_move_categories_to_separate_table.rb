class PageState < ActiveRecord::Base
end

class CollectionItem < ActiveRecord::Base
end

class CategoryItem < ActiveRecord::Base
  belongs_to :categorisable, polymorphic: true
  belongs_to :category
end

class Category < ActiveRecord::Base
  has_many :category_items
  has_many :categorised_items, through: :category_items, source: :categorisable
end

class MoveCategoriesToSeparateTable < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :categories, :name, unique: true

    create_table :category_items do |t|
      t.belongs_to :categorisable, polymorphic: true
      t.belongs_to :category
      t.timestamps
    end

    add_index :category_items, [:categorisable_id, :categorisable_type, :category_id], unique: true, name: "index_unique_categories_on_categorisables"

    [PageState, CollectionItem].each do |categorisable|
      categorisable.find_each do |c|
        if c.categories.present?
          c.categories.split(",").each do |t|
            if Category.where(name: t).exists?
              category = Category.where(name: t).first
            else
              category = Category.create!(name: t)
            end
            CategoryItem.create(categorisable: c, category: category)
          end
        end
      end
    end

    remove_column :page_states, :categories
    remove_column :collection_items, :categories
  end

  def down
    add_column :page_states, :categories, :string
    add_column :collection_items, :categories, :string

    CategoryItems.find_each do |category_item|
      categorygable = category_item.categorygable
      if categorygable.categorys.empty?
        categorygable.categorys = category_item.category.name
      else
        categorygable.categorys += ",#{category_item.category.name}"
      end

      categorygable.save!
    end

    drop_table :categories
    drop_table :category_items
  end
end
