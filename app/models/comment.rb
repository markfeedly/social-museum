class Comment < ActiveRecord::Base
  include Rakismet::Model
  include Authority::Abilities
  self.authorizer_name = 'CommentAuthorizer'

  belongs_to :user
  belongs_to :creator, class_name:  User
  belongs_to :last_editor, class_name:  User
  belongs_to :commentable, polymorphic: true

  validates_presence_of :content
  validate :check_for_spam
  after_create  :notify_subscribers
  after_update :subscribe_creator

  rakismet_attrs :author       => proc { user.try(:name) || 'guest'  },
                 :author_email => proc { user.try(:email) || 'guest' },
                 :user_role    => proc { user.try(:admin?) ? 'administrator' : 'user' }

  def spam!
    self.approved = false
    super
  end

  #todo needs auth check, needs creator_id
  def ham!
    commentable.subscribe(user)
    self.approved = true
    notify_subscribers unless self.notified
    super
  end

  private

  def check_for_spam
    puts '==== In Comment#check_for _spam ========='
    self.approved = !self.spam?
    puts "====   approved is #{self.approved} -------------"
    false
  end

  def subscribe_creator
    #todo dont know why this is being called on comment creation but make it do nothing for now
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