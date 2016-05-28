class RemoveTitleFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :title
  end
end
