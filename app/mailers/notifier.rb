class Notifier < ActionMailer::Base
  default from: "markvanharmelen@gmail.com"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :subject => "[UMCS] Comment on #{comment.page.title} at #{comment.created_at}")
  end
end