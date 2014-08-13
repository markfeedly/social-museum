class RemoveItemNumberAndLocationFromPageStates < ActiveRecord::Migration
  def change
    remove_column :page_states, :item_number
    remove_column :page_states, :location
  end
end
