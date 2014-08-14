class AddTitlesTable < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :slug
      t.belongs_to :titleable, polymorphic: true
      t.timestamps
    end

    add_index :titles, :title, unique: true
    add_index :titles, :slug, unique: true
    add_index :titles, [:titleable_type, :titleable_id]
  end
end
