class RemovePageStateIdFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :page_state_id
  end
end
