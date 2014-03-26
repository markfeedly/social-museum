#require 'parslet'
require 'parsing/content_parser'
require 'parsing/content_transformer'

class ContentHtmlGenerator
  def self.generate(page)
    arry_of_paragraphs = page.content.split("\r\n\r\n").collect do |s|
      s.gsub!(/\r\n/, ' ')
      if !/\r\n/
        begin
          parsed_para = ContentParser.new.parse(s)
          ContentTransformer.new.apply(parsed_para)
        rescue
          "<p yellow-background>Fix this paragraph: #{s}</p>"
        end

      end
    end
    arry_of_paragraphs.join('    ').html_safe
    #"#{page.content.split("\r\n\r\n").join('************')}".html_safe
  end
end