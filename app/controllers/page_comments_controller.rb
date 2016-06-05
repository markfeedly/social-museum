class PageCommentsController < CommentsController
  expose(:page, finder_parameter: :page_id, finder: :find_by_slug)
  def commentable
    page
  end

  def after_page_create_path
    page_path(page)
  end
end