class CommentsController < ApplicationController

  def create
    @page = Page.find_by_slug(params['page_id'])
    @comment = @page.comments.create(user: current_user,
                                     commenter: params[:comment][:commenter],
                                     content: params[:comment][:content]  )
    @comment.request = request
    if @comment.save
      if @comment.approved?
        flash[:notice] = "Comment submited succesfully."
      else
        flash[:error]  = "Comment is waiting to be approved by an admin."
      end
    end
    redirect_to :back
  end

  def index
    @approved_comments = Comment(:approved => true)
    @rejected_comments = Comment(:approved => false) if admin?
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    flash[:notice] = "Comment destroyed"
    redirect_to :back
  end

  def destroy_multiple
    comment.destroy(params[:comment_ids])
    flash[:notice] = "Successfully destroyed comments"
    redirect_to :back
  end

  def approve
    @comment = Comment.find([params[:id]])
    @comment.mark_as_ham!
    redirect_to :back
  end

  def reject
    @comment = Comment.find([params[:id]])
    @comment.mark_as_spam!
    redirect_to :back
  end

  def page_params
    params.require(:comment).permit(:commenter, :content, :user, :page)
  end
end