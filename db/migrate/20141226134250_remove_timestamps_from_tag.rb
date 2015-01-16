class RemoveTimestampsFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :created_at, :string
    remove_column :tags, :updated_at, :string
  end
end
