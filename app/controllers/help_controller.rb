class HelpController < ApplicationController
  include PagesHelper

  expose(:page){ Page.find_by_title('SPECIAL: Help') || get_initalised_page('help') }

end