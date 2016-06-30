class Subscription < ActiveRecord::Base
  include Authority::Abilities
  self.authorizer_name = 'SubscriptionAuthorizer'

  belongs_to :user
  belongs_to :subscribable, polymorphic: true

  def self.subscribe_user_to(user:, subscribable:)
    create(user: user, subscribable: subscribable) unless Subscription.find_by(user: user, subscribable: subscribable)
  end

  def self.unsubscribe_user_from(user:, subscribable:)
    where(user_id: user, subscribable_id: subscribable.id, subscribable_type: subscribable.class.name).delete_all
  end
end