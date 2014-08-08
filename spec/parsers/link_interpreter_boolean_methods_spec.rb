require 'spec_helper'

describe LinkInterpreter, "boolean methods" do

  context "Page titles" do
    it "should recognise a page title" do
      li = LinkInterpreter.new('Some title')
      expect(li.page_title?).to be true
    end

    it "should not recognise a page title as a url" do
      li = LinkInterpreter.new('Some title')
      expect(li.url?).to be false
    end
  end

  context "URLs" do
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
        li = LinkInterpreter.new(url)
        expect(li.url?).to be true
        expect(li.page_title?).to be false
      end

    end

    it "should recognise a bad URL" do
      li = LinkInterpreter.new('http:/hedtek.com')
      expect(li.url?).to be false
      expect(li.page_title?).to be true
    end

    it "should recognise a bad protocol" do
      li = LinkInterpreter.new('ftp://hedtek.com')
      expect(li.url?).to be false
      expect(li.page_title?).to be true
    end

    it "should recognise url suffix" do
      li = LinkInterpreter.new('http://hedtek.com/x')
      expect(li.url?).to be true
      expect(li.url_suffix?).to be true
    end

    it "should recognise no url suffix" do
      li = LinkInterpreter.new('http://hedtek.com/')
      expect(li.url_suffix?).to be false
    end

    it "should extract domain" do
      linkToDomain = {'http://hedtek.com/movie.mp4'      => 'hedtek.com',
                      'https://hedtek.com/movie.mp4'     => 'hedtek.com',
                      'http://www.hedtek.com/movie.mp4'  => 'www.hedtek.com',
                      'https://www.hedtek.com/movie.mp4' => 'www.hedtek.com',
                      'http://hedtek.com/'               => 'hedtek.com',
                      'https://hedtek.com/'              => 'hedtek.com',
                      'http://www.hedtek.com/'           => 'www.hedtek.com',
                      'https://www.hedtek.com/'          => 'www.hedtek.com'}

      linkToDomain.each do |link, domain|
        expect(LinkInterpreter.new(link).domain).to eq domain
      end

    end

    it "should recognise its domain" do
      li = LinkInterpreter.new('http://hedtek.com')
      expect(li.is_domain?('hedtek.com')).to be true
    end
    it "should not recognise a different domain" do
      li = LinkInterpreter.new('http://hedtek.com')
      expect(li.is_domain?('sefol.com')).to be false
    end

    context "Content URLs" do
      context "Image URLs" do
        it "should recognise an image url or not" do
          li = LinkInterpreter.new('http://hedtek.com/x/u/img.zip')
          expect(li.image_url?).to be false
          li = LinkInterpreter.new('http://hedtek.com/image.jpg')
          expect(li.image_url?).to be true
        end

        it "should recognise a bad image URL 1" do
          li = LinkInterpreter.new('http:/hedtek.png')
          expect(li.url?).to be false
        end
        it "should recognise a bad image URL 2" do
          li = LinkInterpreter.new('http:/hedtek.com/movie.mp4')
          expect(li.url?).to be false
        end
      end

      context "Video URLs" do
        context "YouTube" do
          it "should recognise a youtube URL" do
            urls = ['http://youtube.com/embed/0123ABC',
                    'http://youtube.com',
                    'https://youtube.com/embed/0123ABC',
                    'https://youtube.com',
                    'http://www.youtube.com/embed/0123ABC',
                    'http://www.youtube.com',
                    'https://www.youtube.com/embed/0123ABC',
                    'https://www.youtube.com']

            urls.each do |url|
              li = LinkInterpreter.new(url)
              expect(li.is_youtube_url?).to be true
            end

          end

          it "should recognise a non-youtube URL" do
            li = LinkInterpreter.new('http://hedtek.com')
            expect(li.is_youtube_url?).to be false
          end
        end

        context "Vimeo" do
          it "should recognise a vimeo URL" do
            urls = ['http://vimeo.com/channels/staffpicks/42109988',
                    'http://vimeo.com',
                    'https://vimeo.com/channels/staffpicks/42109988',
                    'https://vimeo.com',
                    'http://www.vimeo.com/channels/staffpicks/42109988',
                    'http://www.vimeo.com',
                    'https://www.vimeo.com/channels/staffpicks/42109988',
                    'https://www.vimeo.com']

            urls.each do |url|
              li = LinkInterpreter.new(url)
              expect(li.is_vimeo_url?).to be true
            end

          end

          it "should recognise a non-vimeo URL" do
            li = LinkInterpreter.new('http://hedtek.com')
            expect(li.is_vimeo_url?).to be false
          end
        end
      end
    end
  end
end