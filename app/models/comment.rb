class Comment < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  validates :content, presence: true
  # validates :commenter, presence: true
  #TODO add error feedback if either of the two above are true

  after_create :notify_subscribers

  private

  def notify_subscribers
    subscribe_creator
    (page.subscribers -= [user]).each do |usr|
      Notifier.comment_updated(self, usr).deliver
    end
  end

  private

  def subscribe_creator
    page.subscribe(user)
  end

end

