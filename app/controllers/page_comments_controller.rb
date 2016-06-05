class PageCommentsController < CommentsController
  expose(:page, finder_parameter: :page_id, finder: :find_by_slug)

  #todo work out if this is needed
  def commentable
    page
  end
end