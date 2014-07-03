class SubscriptionsController < ApplicationController

  def index
    pg = Page.find_by_slug('zap')
    pg.subscribe(current_user)
    redirect_to page_path(pg)
  end

end