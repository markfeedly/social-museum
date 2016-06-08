class CollectionCommentsController < CommentsController
  expose(:collection_item, finder_parameter: :collection_item_id, finder: :find_by_slug)

  #todo work out if this is needed

end