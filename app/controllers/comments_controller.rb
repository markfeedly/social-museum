class CommentsController < ApplicationController

  expose(:comment)

  def create
    Page.find_by_slug(params['page_id']).
                      comments.create(user:       current_user,
                                      content:    params[:comment][:content],
                                      user_ip:    request.remote_ip,
                                      user_agent: request.env["HTTP_USER_AGENT"],
                                      referrer:   request.env["HTTP_REFERRER"])
    redirect_to :back
  end

  def destroy
    authorize_action_for comment
    comment.destroy
    redirect_to page_path(params['page_id'])
  end

  def approve
    authorize_action_for comment
    comment.ham!
    comment.save
    redirect_to page_path(params['page_id'])
  end

  def disapprove
    authorize_action_for comment
    comment.spam!
    comment.save
    redirect_to page_path(params['page_id'])
  end

  def index
  end

  def page_params
    params.require(:comment).permit(:user, :content, :page)
  end
end