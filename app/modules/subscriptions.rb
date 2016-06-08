module Subscriptions

  def subscribe(user)
    Subscription.subscribe_user_to(user: user, subscribable: self)
  end

  def unsubscribe(user)
    Subscription.unsubscribe_user_from(user: user, subscribable: self)
  end

  def subscribed?(user)
    subscriptions.where(user_id: user.id).exists?
  end

  private

  def auto_subscribe_user
    subscribe(User.find(user_id))
  end
end
