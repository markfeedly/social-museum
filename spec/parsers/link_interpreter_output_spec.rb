require 'spec_helper'

describe LinkInterpreter do

  def check_outputs(link_interpreter, li_method, html_output)
    expect( link_interpreter.send(li_method)).to eq html_output
    expect( link_interpreter.process).to eq html_output
  end

  it "should output a hyperlink to an existing page" do
    @page = FactoryGirl.create(:page)
    li=LinkInterpreter.new(@page.title)

    check_outputs(li, :process_page_title,
        "<a href='/pages/#{@page.title.downcase.gsub(/ /, '-')}' data-page>#{@page.title}</a>" )
  end

  it "should output a hyperlink to create a missing page" do
    @page = FactoryGirl.create(:page)
    new_page_title = "This is not the title of existing page #{@page.title}; rather for a page to be created by a user"
    li=LinkInterpreter.new(new_page_title)

    check_outputs(li, :process_page_title,
        "<a href='/pages/new?page_title=#{new_page_title.to_param}' data-new-page>#{new_page_title}</a>" )
  end

  it "should output a hyperlink to a URL with no link text" do
    li = LinkInterpreter.new('http://hedtek.com')

    check_outputs(li, :process_url_without_text,
        "<a href='http://hedtek.com' external-link>http://hedtek.com</a>"  )
  end

  it "should output a hyperlink showing link text" do
    url_and_hyperlink_with_text = 'http://hedtek.com/some/page funny money'
    li = LinkInterpreter.new(url_and_hyperlink_with_text)

    check_outputs(li, :process_url_with_text,
        "<a href='http://hedtek.com/some/page' external-link>funny money</a>" )
  end

  it "should process an unsized image" do
    image_url = 'http://hedtek.com/some/page.png'
    li = LinkInterpreter.new(image_url)

    check_outputs(li, :process_image_url_without_width,
        "<img src='#{image_url}'/>" )
  end

  it "should process an image with a width in pixels" do
    image_url_and_width = 'http://hedtek.com/some/page.png 300'
    li = LinkInterpreter.new(image_url_and_width)

    check_outputs(li, :process_image_url_with_width,
        "<img src='http://hedtek.com/some/page.png' style='width: 300px;'/>" )
  end

  it "should process an unsized youtube video" do
    video_url = 'http://www.youtube.com/watch?v=pNe6fsaCVtI'
    li = LinkInterpreter.new(video_url)
    video_slug = video_url.split('=')[-1]

    check_outputs(li, :process_youtube_url,
                  "<iframe src='//youtube.com/embed/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
  end

  it "should process an unsized vimeo video" do
    video_url = 'http://vimeo.com/channels/staffpicks/42109988'
    li = LinkInterpreter.new(video_url)
    video_slug = video_url.split('/')[-1]

    check_outputs(li, :process_vimeo_url,
                  "<iframe src='//player.vimeo.com/video/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
  end

  it "should process a youtube video with width in pixels" do
    video_url = 'http://www.youtube.com/watch?v=pNe6fsaCVtI 400'
    li = LinkInterpreter.new(video_url)
    video_slug = video_url.split('=')[-1].split(' ')[0]

    check_outputs(li, :process_youtube_url,
                  "<iframe src='//youtube.com/embed/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
  end

  it "should process a vimeo video with width in pixels" do
    video_url = 'http://vimeo.com/channels/staffpicks/42109988 400'
    li = LinkInterpreter.new(video_url)
    video_slug = video_url.split('/')[-1].split(' ')[0]

    check_outputs(li, :process_vimeo_url,
                  "<iframe src='//player.vimeo.com/video/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
  end

end