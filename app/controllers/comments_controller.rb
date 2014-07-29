class CommentsController < ApplicationController

  def create
    @page = Page.find_by_slug(params['page_id'])
    @comment = @page.comments.create(user:       current_user,
                                     content:    params[:comment][:content],
                                     user_ip:    request.remote_ip,
                                     user_agent: request.env["HTTP_USER_AGENT"],
                                     referrer:   request.env["HTTP_REFERRER"])
    redirect_to :back
  end

  def index
  end

  def page_params
    params.require(:comment).permit(:user, :content, :page)
  end
end