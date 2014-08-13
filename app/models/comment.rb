class Comment < ActiveRecord::Base
  include Rakismet::Model
  include Authority::Abilities
  self.authorizer_name = 'CommentAuthorizer'

  belongs_to :page
  belongs_to :user

  rakismet_attrs :author       => proc { user.try(:name) || 'guest'  },
                 :author_email => proc { user.try(:email) || 'guest' },
                 :user_role    => proc { user.try(:admin?) ? 'administrator' : 'user' }

  before_create :check_for_spam
  after_create  :subscribe_creator,
                :notify_subscribers

  validates_presence_of :content

  def spam!
    self.approved = false
    super
  end
  
  def ham!
    self.approved = true
    notify_subscribers unless self.notified
    super
  end

  private

  def check_for_spam
    self.approved = !self.spam?
    true
  end

  def subscribe_creator
    page.subscribe(user)
  end

  def notify_subscribers
    if self.approved
      (page.subscribers - [user]).select{|usr| usr.can_read?(self)}.each do |usr|
        Notifier.comment_updated(self, usr).deliver
      end
      self.notified = true
    end
  end

end