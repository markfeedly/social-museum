class AddCreatedByAndLastEditedByToFourTables < ActiveRecord::Migration
  def change
    add_reference  :collection_items, :users, index: true
  end
end
