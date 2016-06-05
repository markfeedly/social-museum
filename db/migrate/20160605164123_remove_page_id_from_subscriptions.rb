class RemovePageIdFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :page_id
  end
end
