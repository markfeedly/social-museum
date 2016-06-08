class CollectionItemAuthorizer < ApplicationAuthorizer
  def self.default(able, user, opts = {})
    user.admin?
  end

  def self.creatable_by?(user, opts={})
    user.admin?
  end

  def self.readable_by?(user, opts = {})
    true
  end

  def self.updatable_by?(user, opts={})
    !user.guest?
  end

  def deleteable_by(user, opts={})
    false
  end

  def subscribable_by?(user, opts={})
    !user.guest? && !resource.subscribed?(user)
  end

  def unsubscribable_by?(user, opts={})
    !user.guest? && resource.subscribed?(user)
  end
end