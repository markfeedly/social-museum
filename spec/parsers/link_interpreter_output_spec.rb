require 'spec_helper'

describe LinkInterpreter, "output" do

  def check_outputs(link_interpreter, li_method, html_output)
    expect( link_interpreter.send(li_method)).to eq html_output
    expect( link_interpreter.process).to eq html_output
  end

  context "Pages" do
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
  end

  context "Hyperlinks" do
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
  end

  context "Content" do
    context "Images" do
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
    end

    context "youtube" do
      let(:video_slug) {"pNe6fsaCVtI"}
      let(:non_video_link) {"http://www.youtube.com"}
      let(:video_link) {"http://www.youtube.com/watch?v=#{video_slug}"}
      let(:video_link_with_playlist) {"http://www.youtube.com/watch?v=#{video_slug}&playlist=awesome_playlist"}
      let(:video_link_reverse_order) {"http://www.youtube.com/watch?playlist=awesome_playlist&v=#{video_slug}"}
      let(:width) {600}
      let(:height) { (width * (9.fdiv(16))).ceil }
      let(:video_link_with_width){"#{video_link} #{width}"}

      it "should process a video link" do
        li = LinkInterpreter.new(video_link)

        check_outputs(li, :process_youtube_url,
                      "<iframe src='//youtube.com/embed/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a video with a width" do
        li = LinkInterpreter.new(video_link_with_width)

        check_outputs(li, :process_youtube_url,
                      "<iframe src='//youtube.com/embed/#{video_slug}' width='#{width}' height='#{height}' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a video with a playlist" do
        li = LinkInterpreter.new(video_link_with_playlist)

        check_outputs(li, :process_youtube_url,
                      "<iframe src='//youtube.com/embed/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a video with a reversed order query string" do
        li = LinkInterpreter.new(video_link_reverse_order)

        check_outputs(li, :process_youtube_url,
                      "<iframe src='//youtube.com/embed/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a youtube link which is not a video" do
        li = LinkInterpreter.new(non_video_link)

        check_outputs(li, :process_youtube_url,
                      "<a href='#{non_video_link}' external-link>#{non_video_link}</a>")
      end
    end

    context "vimeo" do
      let(:video_slug) {"42109988"}
      let(:non_video_link) {"http://www.vimeo.com"}
      let(:video_link) {"http://www.vimeo.com/channels/staffpicks/#{video_slug}"}
      let(:video_link_with_query) {"http://www.vimeo.com/channels/staffpicks/#{video_slug}?playlist=awesome_playlist"}
      let(:width) {600}
      let(:height) { (width * (9.fdiv(16))).ceil }
      let(:video_link_with_width){"#{video_link} #{width}"}

      it "should process a video link" do
        li = LinkInterpreter.new(video_link)

        check_outputs(li, :process_vimeo_url,
                      "<iframe src='//player.vimeo.com/video/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a video with a width" do
        li = LinkInterpreter.new(video_link_with_width)

        check_outputs(li, :process_vimeo_url,
                      "<iframe src='//player.vimeo.com/video/#{video_slug}' width='#{width}' height='#{height}' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a video with a query" do
        li = LinkInterpreter.new(video_link_with_query)

        check_outputs(li, :process_vimeo_url,
                      "<iframe src='//player.vimeo.com/video/#{video_slug}' width='400' height='225' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>")
      end

      it "should process a vimeo link which is not a video" do
        li = LinkInterpreter.new(non_video_link)

        check_outputs(li, :process_vimeo_url,
                      "<a href='#{non_video_link}' external-link>#{non_video_link}</a>")
      end
    end
  end
end