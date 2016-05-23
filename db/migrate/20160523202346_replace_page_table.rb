class ReplacePageTable < ActiveRecord::Migration
  def change
    drop_table :pages
    drop_table :page_states
    create_table :pages do |t|
      t.text :description
      t.integer :lock_version
      t.integer :user_id
      t.timestamps
    end
  end
end
