class AddCreatorAndLastEditorIdsToFourTables < ActiveRecord::Migration
  def change
    add_column :collection_items, :creator_id, :integer
    add_column :collection_items, :last_editor_id, :integer
    add_column :pages, :creator_id, :integer
    add_column :pages, :last_editor_id, :integer
    add_column :resources, :creator_id, :integer
    add_column :resources, :last_editor_id, :integer
    add_column :comments, :creator_id, :integer
    add_column :comments, :last_editor_id, :integer
  end
end
