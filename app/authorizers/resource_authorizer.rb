class ResourceAuthorizer < Authority::Authorizer

  def self.default(adjective, user)
    if adjective == :deletable
      user.admin?
    else
      true
    end
  end

  def updateable_by?(user)
    user.admin? || user == resource.user || resource.new_record?
  end
end

