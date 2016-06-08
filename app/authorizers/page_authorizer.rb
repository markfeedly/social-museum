class PageAuthorizer < Authority::Authorizer

  def self.default(adjective, user, opts={})
    user.admin?
  end

  def self.creatable_by?(user, opts={})
    !user.guest?
  end

  def self.readable_by?(user, opts={})
    true
  end

  def updatable_by?(user, opts={})
    !user.guest?
  end

  def deletable_by?(user, opts={})
    user.admin?
  end

  def collection_item_creatable_by?(user, opts = {})
    user.admin?
  end
end