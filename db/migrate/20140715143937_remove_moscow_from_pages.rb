class RemoveMoscowFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :moscow
  end
end
