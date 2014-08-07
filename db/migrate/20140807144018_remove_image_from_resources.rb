class RemoveImageFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :image
  end
end
