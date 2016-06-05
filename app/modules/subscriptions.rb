module Subscriptions

  def subscribe(user)
    subscribers << user unless subscribers.include?(user)
  end

  def unsubscribe(user)
    Subscription.unsubscribe_from(user: user, subscribable: self)
  end

  def subscribed?(user)
    subscriptions.where(user_id: user.id).exists?
  end
end
