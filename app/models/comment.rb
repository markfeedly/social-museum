class Comment < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  validates :content, presence: true
  # validates :commenter, presence: true
  #TODO add error feedback if either of the two above are true

  after_create :subscribe_creator

  private

  def subscribe_creator
    page.subscribe_user(user)
  end

end

