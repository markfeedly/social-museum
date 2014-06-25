class CreatePageSubscribersTable < ActiveRecord::Migration
  def change
    create_table :page_subscribers, :id => false do |t|
      t.integer :page_id
      t.integer :user_id
    end
  end
end
