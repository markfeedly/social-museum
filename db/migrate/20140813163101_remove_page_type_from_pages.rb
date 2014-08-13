class RemovePageTypeFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :page_type
  end
end
