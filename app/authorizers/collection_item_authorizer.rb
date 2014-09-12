class CollectionItemAuthorizer < ApplicationAuthorizer
  def self.default(able, user, opts = {})
    user.admin?
  end

  def self.readable_by?(user, opts = {})
    true
  end

  def subscribable_by?(user, opts={})
    !user.guest? && !resource.subscribed?(user)
  end

  def unsubscribable_by?(user, opts={})
    !user.guest? && resource.subscribed?(user)
  end
end