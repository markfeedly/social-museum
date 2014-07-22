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
        "<p>preamble </p><a href='/pages/#{page.slug}' data-page>#{page.title}</a><p> postamble</p>\n"
  end

  it "should process a non-existing page title" do
    page.update(user: user, content: "pre-amble [My non-existent title] post-amble")

    expect(ContentHtmlGenerator.generate_full(page)).to eq \
        "<p>pre-amble </p><a href='/pages/new?page_title=My non-existent title' data-new-page>My non-existent title</a><p> post-amble</p>\n"
  end

  it "should process an embedded image" do
    page.update(user: user, content: 'pre-amble [http://a.b/img.png] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p>pre-amble </p><div><img src='http://a.b/img.png'/></div><p> post-amble</p>\n"
  end

  it "should process an embedded image and width" do
    #pending 'look into what should really be output in tricky circumstances'
    page.update(user: user, content: 'pre-amble [http://a.b/img.png 100] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<p>pre-amble </p><div><img src='http://a.b/img.png' style='width: 100px;'/></div><p> post-amble</p>\n"
  end

  it "should process an embedded image and width in tricky circumstances" do
    pending 'look into what should really be output re paras and divs'
    page.update(user: user, content: '[http://a.b/first.png 100] some text [http://a.b/second.png 100] post-amble')

    ContentHtmlGenerator.generate_full(page).should ==
        "<div><img src='http://a.b/first.png' style='width: 100px;'/></div><p>some text</p><div><img src='http://a.b/second.png' style='width: 100px;'/></div><p> post-amble</p>\n"
  end

  it "should process an only on line image and width" do
    page.update(user: user, content: '[http://a.b/img.png 100]')

    ContentHtmlGenerator.generate_full(page).should ==
        "<div><img src='http://a.b/img.png' style='width: 100px;'/></div>\n"
  end

end
