require 'spec_helper'

describe LinkInterpreter do

  it "should recognise a page title" do
    li = LinkInterpreter.new('Some title')
    li.page_title?.should be_true
  end

  it "should not recognise a page title as a url" do
    li = LinkInterpreter.new('Some title')
    li.url?.should be_false
  end

  it "should recognise a URL as a URL and not a page title" do
    urls = ['http://hedtek.com',
            'https://hedtek.com',
            'http://www.hedtek.com',
            'https://www.hedtek.com',
            'http://hedtek.com/xx',
            'https://hedtek.com/xx',
            'http://www.hedtek.com/xx',
            'https://www.hedtek.com/xx',
            'http://hedtek.com/xx/y-y',
            'https://hedtek.com/xx/y-y',
            'http://www.hedtek.com/xx/y-y',
            'https://www.hedtek.com/xx/y-y',
            'http://hedtek.com/xx/y-y/img.png',
            'https://hedtek.com/xx/y-y/img.png',
            'http://www.hedtek.com/xx/y-y/img.png',
            'https://www.hedtek.com/xx/y-y/img.png']

    urls.each do |url|
      puts url
      li = LinkInterpreter.new(url)
      li.url?.should be_true
      li.page_title?.should be_false
    end

  end

  it "should recognise a bad URL" do
    li = LinkInterpreter.new('http:/hedtek.com')
    expect(li.url?).to be_false
    expect(li.page_title?).to be_true
  end

  it "should recognise a bad protocol" do
    li = LinkInterpreter.new('ftp://hedtek.com')
    expect(li.url?).to be_false
    expect(li.page_title?).to be_true
  end

  it "should recognise url suffix" do
    li = LinkInterpreter.new('http://hedtek.com/x')
    li.url?.should == true
    li.url_suffix?.should == true
  end

  it "should recognise no url suffix" do
    li = LinkInterpreter.new('http://hedtek.com/')
    li.url_suffix?.should == false
  end

  it "should recognise an image url or not" do
    li = LinkInterpreter.new('http://hedtek.com/x/u/img.zip')
    li.image_url?.should == false
    li = LinkInterpreter.new('http://hedtek.com/image.jpg')
    li.image_url?.should == true
  end

  it "should recognise a bad image URL 1" do
    li = LinkInterpreter.new('http:/hedtek.png')
    li.url?.should == false
  end
  it "should recognise a bad image URL 2" do
    li = LinkInterpreter.new('http:/hedtek.com/movie.mp4')
    li.url?.should == false
  end
  it "should extract domain" do
    li = LinkInterpreter.new('http://hedtek.com/movie.mp4')
    li.domain.should == 'hedtek.com'
    li = LinkInterpreter.new('https://hedtek.com/')
    li.domain.should == 'hedtek.com'
    li = LinkInterpreter.new('http://hedtek.com')
    li.domain.should == 'hedtek.com'
    li = LinkInterpreter.new('http://www.hedtek.com/')
    li.domain.should == 'www.hedtek.com'
  end

  it "should recognise its domain" do
    li = LinkInterpreter.new('http://hedtek.com')
    li.is_domain?('hedtek.com').should == true
  end
  it "should not recognise a different domain" do
    li = LinkInterpreter.new('http://hedtek.com')
    li.is_domain?('sefol.com').should == false
  end

  it "should recognise a youtube URL" do
    li = LinkInterpreter.new('http://youtube.com/embed/0123ABC')
    li.is_youtube_url?.should == true
    li = LinkInterpreter.new('http://www.youtube.com')
    li.is_youtube_url?.should == true
  end
  it "should recognise a non-youtube URL" do
    li = LinkInterpreter.new('http://hedtek.com')
    li.is_youtube_url?.should == false
  end


end
