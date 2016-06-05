module Subscriptions

  def subscribe_creator
    #Subscription.subscribe_to(user: User.find(user_id), subscribable: self)
    Subscription.create(subscribable_type: 'Page', subscribable_id: self.id, user_id: user_id, page_id: -1)
    1 == 1
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
