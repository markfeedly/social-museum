require 'spec_helper'

describe LinkInterpreter do

  it "should output a hyperlink to an existing page" do
    @page = FactoryGirl.create(:page)
    li=LinkInterpreter.new(@page.title)
    li.process_page_title.should ==
        "<a href='/pages/#{@page.title.downcase.gsub(/ /, '-')}' data-page>#{@page.title}</a>"
    li.process.should ==
        "<a href='/pages/#{@page.title.downcase.gsub(/ /, '-')}' data-page>#{@page.title}</a>"
  end

  it "should output a hyperlink to a missing page" do
    @page = FactoryGirl.create(:page)
    new_page_title = "This is not the title of existing page #{@page.title}; rather for a page to be created by a user"
    li=LinkInterpreter.new(new_page_title)
    li.process_page_title.should ==
        "<a href='/pages/new?page_title=#{title.to_param}' data-new-page>#{title}</a>"
    li.process.should ==
        "<a href='/pages/new?page_title=#{title.to_param}' data-new-page>#{title}</a>"
  end

  it "should output a hyperlink to a URL with no link text" do
    li = LinkInterpreter.new('http://hedtek.com')
    li.process.should ==
        "<a href='http://hedtek.com' external-link>http://hedtek.com</a>"
    li.process.should ==
        "<a href='http://hedtek.com' external-link>http://hedtek.com</a>"
  end

  it "should output a hyperlink to a URL link text" do
    url = 'http://hedtek.com/some/page'
    li = LinkInterpreter.new(url)
    li.process_url_without_text.should ==
        "<a href='#{url}' external-link>#{url}</a>"
    li.process.should ==
        "<a href='#{url}' external-link>#{url}</a>"
  end

  it "should output a hyperlink showing text" do
    url_and_hyperlink_with_text= 'http://hedtek.com/some/page funny money'
    li = LinkInterpreter.new(url_and_hyperlink_with_text)
    li.process_url_with_text.should ==
        "<a href='http://hedtek.com/some/page' external-link>funny money</a>"
    li.process.should ==
        "<a href='http://hedtek.com/some/page' external-link>funny money</a>"
  end

  it "should process an unsized image" do
    image_url= 'http://hedtek.com/some/page.png'
    li = LinkInterpreter.new(image_url)
    li.process_image_url_without_width.should ==
        "<div><img src='#{image_url}'/></div>"
    li.process.should ==
        "<div><img src='#{image_url}'/></div>"
  end

  it "should process an image with a display width in pixels" do
    image_url_and_width= 'http://hedtek.com/some/page.png  300'
    li=LinkInterpreter.new(image_url_and_width)
    li.process_image_url_with_width.should ==
        "<div><img src='http://hedtek.com/some/page.png' style='width: 300px;'/></div>"
    li.process.should ==
        "<div><img src='http://hedtek.com/some/page.png' style='width: 300px;'/></div>"
  end

end