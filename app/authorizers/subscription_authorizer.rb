class SubscriptionAuthorizer < Authority::Authorizer

  def self.default(adjective, user)
    user.admin?
  end

  def self.creatable_by?(user, opts = {})
    !user.guest?
  end

  def self.readable_by?(user, opts={})
    !user.guest?
  end

  def deletable_by?(user, opts={})
    resource.user == user || super
  end

  def readable_by?(user, opts={})
    resource.user == user || super
    false
  end
end