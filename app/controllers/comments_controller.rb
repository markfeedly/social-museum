class CommentsController < ApplicationController

  expose(:comment)

  def create
    commentable.comments.create(user:       current_user,
                                content:    params[:comment][:content],
                                user_ip:    request.remote_ip,
                                user_agent: request.env["HTTP_USER_AGENT"],
                                referrer:   request.env["HTTP_REFERRER"])
    redirect_to after_comment_create_path
  end

  def destroy
    authorize_action_for comment
    comment.destroy
    redirect_to :back
  end

  def approve
    authorize_action_for comment
    comment.ham!
    comment.save
    redirect_to :back
  end

  def disapprove
    authorize_action_for comment
    comment.spam!
    comment.save
    redirect_to :back
  end
end