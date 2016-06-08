class CorrectionRemoveCols < ActiveRecord::Migration
  def change
    remove_column :collection_items, :creator
    remove_column :collection_items, :last_editor
    remove_column :pages, :creator
    remove_column :pages, :last_editor
    remove_column :resources, :creator
    remove_column :resources, :last_editor
    remove_column :comments, :creator
    remove_column :comments, :last_editor
  end
end
