require 'spec_helper'

describe ContentHtmlGenerator do

  let(:user) { FactoryGirl.create(:user) }
  let(:page) { FactoryGirl.create(:page, user: user) }

  it "should process plain text correctly" do
    expect(ContentHtmlGenerator.generate_full(page)).to eq "<p>#{page.content}</p>\n"
  end

  it "should process an existing page title correctly" do
    page.update(user: user, content: "preamble [#{page.title}] postamble")

    expect(ContentHtmlGenerator.generate_full(page)).to eq \
        "<p>preamble <a href='/pages/#{page.slug}' data-page>#{page.title}</a> postamble</p>\n"
  end

  it "should process a non-existing page title" do
    page.update(user: user, content: "pre-amble [My non-existent title] post-amble")

    expect(ContentHtmlGenerator.generate_full(page)).to eq \
        "<p>pre-amble <a href='/pages/new?page_title=My non-existent title' data-new-page>My non-existent title</a> post-amble</p>\n"
  end

  it "should process an embedded image" do
    page.update(user: user, content: 'pre-amble [http://a.b/img.png] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p>pre-amble <img src='http://a.b/img.png'/> post-amble</p>\n"
  end

  it "should process an embedded image and width" do
    #pending 'look into what should really be output in tricky circumstances'
    page.update(user: user, content: 'pre-amble [http://a.b/img.png 100] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p>pre-amble <img src='http://a.b/img.png' style='width: 100px;'/> post-amble</p>\n"
  end

  it "should process an embedded image and width in tricky circumstances" do
    #pending 'look into what should really be output re paras and divs'
    page.update(user: user, content: '[http://a.b/first.png 100] some text [http://a.b/second.png 100] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p><img src='http://a.b/first.png' style='width: 100px;'/> some text <img src='http://a.b/second.png' style='width: 100px;'/> post-amble</p>\n"
  end

  it "should process an only on line image and width" do
    page.update(user: user, content: '[http://a.b/img.png 100]')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p><img src='http://a.b/img.png' style='width: 100px;'/></p>\n"
  end

end