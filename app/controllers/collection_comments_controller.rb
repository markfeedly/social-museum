class CollectionCommentsController < CommentsController
  expose(:collection_item, finder_parameter: :collection_item_id, finder: :find_by_slug)
  def commentable
    collection_item
  end

  def after_comment_create_path
    collection_item_path(collection_item)
  end
end