class PageState < ActiveRecord::Base
end

class CollectionItem < ActiveRecord::Base
end

class TagItem < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  belongs_to :tag
end

class Tag < ActiveRecord::Base
  has_many :tag_items
  has_many :tagged_items, through: :tag_items, source: :taggable
end

class MoveTagsToSeparateTable < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :tags, :name, unique: true

    create_table :tag_items do |t|
      t.belongs_to :taggable, polymorphic: true
      t.belongs_to :tag
      t.timestamps
    end

    add_index :tag_items, [:taggable_id, :taggable_type, :tag_id], unique: true

    [PageState, CollectionItem].each do |taggable|
      taggable.find_each do |c|
        if c.tags.present?
          c.tags.split(",").each do |t|
            if Tag.where(name: t).exists?
              tag = Tag.where(name: t).first
            else
              tag = Tag.create!(name: t)
            end
            TagItem.create(taggable: c, tag: tag)
          end
        end
      end
    end

    remove_column :page_states, :tags
    remove_column :collection_items, :tags
  end

  def down
    add_column :page_states, :tags, :string
    add_column :collection_items, :tags, :string

    TagItem.find_each do |tag_item|
      taggable = tag_item.taggable
      if taggable.tags.empty?
        taggable.tags = tag_item.tag.name
      else
        taggable.tags += ",#{tag_item.tag.name}"
      end

      taggable.save!
    end

    drop_table :tags
    drop_table :tag_items
  end
end
