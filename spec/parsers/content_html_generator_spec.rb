require 'spec_helper'

describe ContentHtmlGenerator do

  let(:user) { FactoryGirl.create(:user) }
  let(:page) { FactoryGirl.create(:page, user: user) }

  it "should process plain text correctly" do
    expect(ContentHtmlGenerator.generate_full(page)).to include
        "<p>#{page.content}</p>"
  end

  context "Page titles" do
    it "should process an existing page title correctly" do
      page.update(user: user, content: "preamble [#{page.title}] postamble")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<a href='/pages/#{page.slug}' data-page>#{page.title}</a>"
    end

    it "should process a non-existing page title" do
      page.update(user: user, content: "pre-amble [My non-existent title] post-amble")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<a href='/pages/new?page_title=My non-existent title' data-new-page>My non-existent title</a>"
    end
  end

  context "Images" do
    it "should process an embedded image" do
      page.update(user: user, content: "pre-amble [http://a.b/img.png] post-amble")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<img src='http://a.b/img.png'/>"
    end

    it "should process an embedded image and width" do
      page.update(user: user, content: "pre-amble [http://a.b/img.png 100] post-amble")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<img src='http://a.b/img.png' style='width: 100px;'/>"
    end

    it "should process an embedded image and width in tricky circumstances" do
      page.update(user: user, content: "[http://a.b/first.png 100] some text [http://a.b/second.png 100] post-amble")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<img src='http://a.b/first.png' style='width: 100px;'/>"

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<img src='http://a.b/second.png' style='width: 100px;'/>"
    end

    it "should process an only on line image and width" do
      page.update(user: user, content: "[http://a.b/img.png 100]")

      expect(ContentHtmlGenerator.generate_full(page)).to include
          "<img src='http://a.b/img.png' style='width: 100px;'/>"
    end
  end

end