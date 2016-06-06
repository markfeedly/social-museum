class HomeController < ApplicationController
  include PagesHelper

  expose(:page){ Page.find_by_title('SPECIAL: Home') || get_initalised_page('home') }

  def index
  end
end
