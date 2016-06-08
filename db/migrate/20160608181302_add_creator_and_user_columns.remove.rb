class AddCreatorAndUserColumns < ActiveRecord::Migration
  def change
    add_column :collection_items, :creator, :integer
    add_column :collection_items, :last_editor, :integer
    add_column :pages, :creator, :integer
    add_column :pages, :last_editor, :integer
    add_column :resources, :creator, :integer
    add_column :resources, :last_editor, :integer
    add_column :comments, :creator, :integer
    add_column :comments, :last_editor, :integer
  end
end
