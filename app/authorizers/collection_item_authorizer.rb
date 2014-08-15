class CollectionItemAuthorizer < ApplicationAuthorizer
  def self.default(able, user, opts = {})
    user.admin?
  end

  def self.readable_by?(user, opts = {})
    true
  end
end
