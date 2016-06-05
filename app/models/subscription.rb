class Subscription < ActiveRecord::Base
  include Authority::Abilities
  self.authorizer_name = 'SubscriptionAuthorizer'

  belongs_to :user
  belongs_to :subscribable, polymorphic: true

  def self.subscribe_to(user:, subscribable:)
    create(user: user, subscribable: subscribable) if can_create?(self)
  end

  def self.unsubscribe_from(user:, subscribable:)
    where(user_id: user, subscribable_id: subscribable.id, subscribable_type: subscribable.class.name).delete_all
  end
end