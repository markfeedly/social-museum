class ResourceUsage < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  belongs_to :page
end

class MoveResourceUsagesToPolymorphic < ActiveRecord::Migration
  def change
    change_table :resource_usages do |t|
      t.belongs_to :resourceable, polymorphic: true
    end

    ResourceUsage.all.each do |r_u|
      r_u.resourceable = r_u.page
      r_u.save!
    end
  end
end
