class ResourceAuthorizer < Authority::Authorizer

  def self.default(adjective, user, opts={})
    user.admin?
  end

  def self.creatable_by?(user, opts={})
    !user.guest?
  end

  def readable_by?(user, opts={})
    true
  end

  def updatable_by?(user)
    !user.guest? && (user == resource.user || resource.new_record? || super)
  end
end