class RemoveTitlesAndSlugs < ActiveRecord::Migration
  def change
    remove_column :pages, :title
    remove_column :pages, :slug

    remove_column :collection_items, :name
    remove_column :collection_items, :slug
  end
end
