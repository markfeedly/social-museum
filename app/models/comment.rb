class Comment < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  validates :content, presence: true
  # validates :commenter, presence: true
  #TODO add error feedback if either of the two above are true

  after_create :subscribe_creator, :notify_subscribers

  private

  def subscribe_creator
    page.subscribe(user)
  end

  def notify_subscribers
    (page.subscribers - [user]).each do |usr|
      Notifier.comment_updated(self, usr).deliver
    end
  end


end

