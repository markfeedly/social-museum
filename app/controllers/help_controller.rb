class HelpController < ApplicationController

  expose(:page){ Page.find_by_title('SPECIAL: Help') }

end