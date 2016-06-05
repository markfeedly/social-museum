class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscribable, polymorphic: true

  def self.subscribe_to(user:, subscribable:)
    create(user: user, subscribable: subscribable)
  end

  def self.unsubscribe_from(user:, subscribable:)
    where(user_id: user, subscribable_id: subscribable.id, subscribable_type: subscribable.class.name).delete_all
  end
end