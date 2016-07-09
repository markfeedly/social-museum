class HomeController < ApplicationController
  include PagesHelper

  expose(:page){ Page.find_by_title('Home') || make_initalised_page('home') }

  def index
  end
end
