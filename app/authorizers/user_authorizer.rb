class UserAuthorizer < Authority::Authorizer
  def self.default(able, user, opts={})
    user.admin?
  end

  def readable_by?(user, opts={})
    resource == user || super
  end
end