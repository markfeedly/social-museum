class ResourceAuthorizer < Authority::Authorizer

  def self.default(adjective, user, opts={})
    user.admin?
  end

  def self.creatable_by?(user, opts={})
    !user.guest?
  end

  def self.readable_by?(user, opts={})
    true
  end

  def self.updatable_by?(user, opts={})
    !user.guest?
  end

  def subscribable_by?(user, opts={})
    !user.guest? && !resource.subscribed?(user)
  end

  def unsubscribable_by?(user, opts={})
    !user.guest? && resource.subscribed?(user)
  end

  def link_changeable_by?(user, opts={})
    !user.guest? && (user == resource.user || resource.new_record? || super)
  end

end