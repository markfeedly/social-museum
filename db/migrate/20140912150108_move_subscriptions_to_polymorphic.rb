class Subscription < ActiveRecord::Base
  belongs_to :page
  belongs_to :subscribable, polymorphic: true
end

class MoveSubscriptionsToPolymorphic < ActiveRecord::Migration
  def change
    change_table :subscriptions do |t|
      t.belongs_to :subscribable, polymorphic: true
    end

    Subscription.all.each do |s|
      s.subscribable = s.page
      s.save!
    end
  end
end