class CommentsController < ApplicationController

  expose(:comment)
  expose(:page){Page.find(params[:comment][:commentable_id].to_i)}
  expose(:collection_item){CollectionItem.find(params[:comment][:commentable_id].to_i)}
  expose(:resource){Resource.find(params[:comment][:commentable_id].to_i)}

  def create
    path_method = (params['comment']['commentable_type'].underscore+'_path').to_sym
    c = Comment.create( user:   current_user,
                        creator: current_user,
                        content:    params[:comment][:content],
                        user_ip:    request.remote_ip,
                        commentable_type: params[:comment][:commentable_type],
                        commentable_id: params[:comment][:commentable_id].to_i,
                        user_agent: request.env["HTTP_USER_AGENT"],
                        referrer:   request.env["HTTP_REFERRER"] )
    commentable.comments << c
    redirect_to send(path_method, commentable)
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
    comment.commentable.subscribe(comment.user)
    redirect_to :back
  end

  def disapprove
    authorize_action_for comment
    comment.spam!
    comment.save
    # todo need to think about this in the light of rakismet and about if manually unsubscribing then is the user good, or not
    # todo and are they doing it themselves? comment.commentable.unsubscribe(comment.user)

    redirect_to :back
  end

  def comment_params
    params.require(:page).permit(:content,
                                 :commentable_id,
                                 :commentable_type)
  end
end