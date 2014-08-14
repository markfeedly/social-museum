class CollectionItemAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user, opts = {})
    user.admin?
  end

  def self.updatable_by?(user, opts = {})
    user.admin?
  end

  def self.deleteable_by?(user, opts = {})
    false
  end

  def self.readable_by?(user, opts = {})
    true
  end
end
