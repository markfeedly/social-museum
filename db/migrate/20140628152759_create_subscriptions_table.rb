class CreateSubscriptionsTable < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :page_id
      t.integer :user_id
    end
    add_index :subscriptions, :page_id
    add_index :subscriptions, :user_id
  end
end
