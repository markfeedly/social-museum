class TagsController < ApplicationController

  expose(:paginated_pages) { Tag.where(name: params[:id]).first.pages}


end