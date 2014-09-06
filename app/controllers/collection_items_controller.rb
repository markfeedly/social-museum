class CollectionItemsController < ApplicationController
  respond_to :html

  expose(:page_summaries) { Kaminari.paginate_array(Page.joins(:page_title).order('titles.title ASC').reject {|p| p.history.last.item_number==nil }).page(params[:page_summaries]).per(10) }

  def index
    respond_with(page_summaries)
  end

end
