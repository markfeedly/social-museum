class Notifier < ActionMailer::Base
  default from: "markvanharmelen@gmail.com"

  def comment_updated(comment, user)
    @comment = comment
    @page    = comment.page
    @user    = user

    mail(:to      => user.email,
         :subject => "[#{ENV['MUSEUM_NAME']}] New comment on page #{comment.page.name} at #{comment.created_at}")
  end
end