class CommentAuthorizer < Authority::Authorizer

  def self.default(adjective, user)
    user.admin?
  end

  def self.creatable_by?(user, opts = {})
    #todo check comments can't be made by url haking
    # if ENV['ALLOW_GUEST_COMMENTS']
    #  true
    #else
      !user.guest?
    #end
  end

  def deletable_by?(user, opts={})
    resource.user == user || super
  end

  def readable_by?(user, opts={})
    resource.approved? || resource.user == user || super
  end

  def disapprove_by?(user, opts={})
    resource.approved? && user.admin?
  end

  def approve_by?(user, opts={})
    !resource.approved? && user.admin?
  end
end