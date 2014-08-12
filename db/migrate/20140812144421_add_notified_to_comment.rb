class AddNotifiedToComment < ActiveRecord::Migration
  def change
    add_column :comments, :notified, :boolean, default: false
  end
end
