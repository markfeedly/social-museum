require 'spec_helper'
include ERB::Util

describe 'Asset URL' do




  # ----------------------------------------------------

  it "should have a vaid filename" do
    assert_generates '/get_uploaded_file/images/1/any.png', { :controller => "resources", :action => "get_uploaded_file",
                                                              type: 'images', :id => "1", name: 'any.png'}
    assert_recognizes( { :controller => "resources", :action => "get_uploaded_file", type: 'images', :id => "1", name: 'any', format: 'png'}, '/get_uploaded_file/images/1/any.png')
    assert_recognizes( { :controller => "resources", :action => "get_uploaded_file", type: 'images', :id => "1", name: 'Screen_Shot_2016-06-22_at_17', format: 'x.png'}, '/get_uploaded_file/images/1/Screen_Shot_2016-06-22_at_17.x.png')


  end

end