class Comment < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  validates_presence_of :content, :commenter
  before_create :check_for_spam
  after_create :subscribe_creator, :notify_subscribers

  def request=(request)
    self.user_ip    = request.remote_ip
    self.user_agent = request.env["HTTP_USER_AGENT"]
    self.referrer   = request.env["HTTP_REFERRER"]
  end

  def check_for_spam
    self.approved = !Akismetor.spam?(akismet_attributes)
    true
  end

  def akismet_attributes
    {
        :key                  => ENV['WORDPRESS_KEY'],
        :blog                 => root_path,
        :user_ip              => user_ip,
        :user_agent           => user_agent,
       #:comment_author       => commenter, # How can these be derived from attached :commenter
       #:comment_author_email => email,     # ?
        :comment_content      => content
    }
  end

  def mark_as_spam!
    update_attribute(:approved, false)
    Akismetor.submit_spam(akismet_attributes)
  end

  def mark_as_ham!
    update_attribute(:approved, true)
    Akismetor.submit_spam(akismet_attributes)
  end

  def notify_subscribers
    (page.subscribers - [user]).each do |usr|
      Notifier.comment_updated(self, usr).deliver
    end
  end

  private

  def subscribe_creator
    page.subscribe(user)
  end

end