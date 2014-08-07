class CreateUploadsTable < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :type
      t.string :file

      t.timestamps
    end
  end
end
