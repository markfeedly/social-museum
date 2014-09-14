class AddExtraColsToCollectionItems < ActiveRecord::Migration
  def change
    add_column :collection_items, :lock_version, :integer
    add_column :collection_items, :user_id,      :integer
    add_column :collection_items, :tags,         :string
    add_column :collection_items, :categories,   :string
  end
end
