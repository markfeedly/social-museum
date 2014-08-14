class AddCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :item_number
      t.string :slug

      t.timestamps
    end

    create_table :related_collection_items do |t|
      t.references :source_collection_item
      t.string :relation_type
      t.references :target_collection_item
      t.timestamps
    end
  end
end
