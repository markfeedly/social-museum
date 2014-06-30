class SubscribeController < ApplicationController

  def index
    pg = Page.find_by_slug(params['page_id'])
    pg.subscribe(current_user)
    redirect_to page_path(pg)
  end

end