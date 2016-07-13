class HomeController < ApplicationController

  expose(:page){ Page.find_by_title('Home') }

  def index
  end
end
