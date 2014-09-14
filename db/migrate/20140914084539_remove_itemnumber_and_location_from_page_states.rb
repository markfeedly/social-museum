class RemoveItemnumberAndLocationFromPageStates < ActiveRecord::Migration
  def change
    remove_column :page_states, :location
    remove_column :page_states, :item_number
  end
end
