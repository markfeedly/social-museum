class RemovePageIdFromResourceUsages < ActiveRecord::Migration
  def change
    remove_column :resource_usages, :page_id
  end
end
