class Comment < ActiveRecord::Base
  include Rakismet::Model
  include Authority::Abilities
  self.authorizer_name = 'CommentAuthorizer'

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  after_update :subscribe_creator
  #todo after_create :notify_subscribers

  rakismet_attrs :author       => proc { user.try(:name) || 'guest'  },
                 :author_email => proc { user.try(:email) || 'guest' },
                 :user_role    => proc { user.try(:admin?) ? 'administrator' : 'user' }

  #todo before_create :check_for_spam
  after_create  :subscribe_creator,
                :notify_subscribers

  validates_presence_of :content

  def spam!
    self.approved = false
    super
  end
  
  def ham!
    commentable.subscribe(user) #todo needs auth check, needs creator_id

    self.approved = true
    notify_subscribers unless self.notified
    super
  end

  private

  def check_for_spam
    puts 'cfs========='
    self.approved = false #!self.spam?
    puts "#{self.approved} -------------"
    false
  end

  def subscribe_creator
    commentable.subscribe(user)
  end

  def notify_subscribers
    if self.approved
      ( commentable.subscribers - [user] ).each do |usr|
        Notifier.comment_updated(self, usr).deliver if usr.can_read?(self)
      end
      self.notified = true
    elsif
      self.notified = false
    end
  end

end