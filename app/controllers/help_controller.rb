class HelpController < ApplicationController
  include PagesHelper

  expose(:page){ make_initalised_page('home') && make_initalised_page('help') }

end