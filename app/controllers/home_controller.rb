class HomeController < ApplicationController
  expose(:page){ Page.find_by_title('SPECIAL: splash page') || get_home_page_config_data }

  def index
  end
end
