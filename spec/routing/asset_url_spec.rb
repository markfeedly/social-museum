require 'spec_helper'
include ERB::Util

describe 'Asset URL' do




  # ----------------------------------------------------

  it "should have a valid filename" do
    assert_generates '/get_uploaded_file/images/1/any.png', { :controller => "resources", :action => "get_uploaded_file",
                                                              type: 'images', :id => "1", name: 'any.png'}
    assert_recognizes( { :controller => "resources", :action => "get_uploaded_file", type: 'images', :id => "1", name: 'any', format: 'png'}, '/get_uploaded_file/images/1/any.png')
    r = Resource.new
    expect(r.sanetise_filename('a.b')).to eq 'a.b'
    expect(r.sanetise_filename('a.b.c')).to eq 'a_b.c'
    expect(r.sanetise_filename('a.b.c.d')).to eq 'a_b_c.d'

  end

end