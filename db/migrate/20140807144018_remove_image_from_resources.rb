class RemoveImageFromResources < ActiveRecord::Migration
  def up
    remove_column :resources, :image
  end
end
