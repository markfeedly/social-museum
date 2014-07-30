class Comment < ActiveRecord::Base
  include Rakismet::Model
  include Authority::Abilities
  self.authorizer_name = 'CommentAuthorizer'

  belongs_to :page
  belongs_to :user

  rakismet_attrs :author       => proc { user.name  },
                 :author_email => proc { user.email }

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
    (page.subscribers - [user]).each do |usr|
      Notifier.comment_updated(self, usr).deliver
    end
  end

end