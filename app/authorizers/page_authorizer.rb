class PageAuthorizer < Authority::Authorizer

  def self.default(adjective, user, opts={})
    user.admin?
  end

  def self.creatable_by?(user, opts={})
    !user.guest?
  end

  def deletable_by?(user, opts={})
    user.admin?
  end

  def updatable_by?(user, opts={})
    !user.guest?
  end

  def subscribable_by?(user, opts={})
    !user.guest? && !resource.subscribed?(user)
  end

  def unsubscribable_by?(user, opts={})
    !user.guest? && resource.subscribed?(user)
  end
end