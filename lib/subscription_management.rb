module SubscriptionManagement

  def subscribe_creator
    Subscription.subscribe_to(user: User.find(user_id), subscribable: self)
  end

  def subscribe(user)
    subscribers << user
    # Subscription.subscribe_to(user: user, subscribable: self)
  end

  def unsubscribe(user)
    Subscription.unsubscribe_from(user: user, subscribable: self)
  end

  def subscribed?(user)
    subscriptions.where(user_id: user.id).exists?
  end
end
