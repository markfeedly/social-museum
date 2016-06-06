class AddTrackingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :track_created_pages, :boolean
    add_column :users, :track_commented_pages, :boolean
  end
end
