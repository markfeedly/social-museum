class AddNameToThreeTables < ActiveRecord::Migration
  def change
    add_column :collection_items, :name, :string
    add_index  :collection_items, :name, unique: true
    add_column :pages, :name, :string
    add_index  :pages, :name, unique: true
    add_column :resources, :name, :string
    add_index  :resources, :name, unique: true
  end
end
