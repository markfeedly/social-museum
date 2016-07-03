require 'uri'
require 'pp'

class LinkInterpreter
  #TODO Large restructure of this file
  def url
    @first
  end

  def initialize text
    @text = text.strip
    @first, @rest = @text.split(/ +/, 2)
  end

  def url?
    @uri = URI.parse(@first)
    valid_scheme? && valid_host?
  rescue URI::BadURIError, URI::InvalidURIError
    false
  end

  def page_title?
    ! (url? || empty?)
  end

  def empty?
    @text.blank?
  end

  def valid_scheme?
    %w( http https ).include?(@uri.scheme)
  end

  def valid_host?
    !(@uri.host.nil? || @uri.host.include?(".."))
  end

  def url_suffix?
    url? && ( !!(@first =~ /:\/\/..*\/..*/   ))
  end

  def image_url?
    url_suffix? && ( !!(@first.downcase =~ /\.png$/) || !!(@first.downcase =~ /\.jpg$/) || !!(@first.downcase =~ /\.jpeg$/) || !!(@first.downcase =~ /\.gif/))
  end

  def domain
    return nil unless url?
    d = @first.gsub(/https?:\/\//, '')
    d.gsub!(/\/.*/, '')
    d
  end

  #TODO test this
  def is_domain? domain_to_match
    (@first =~ /https?\:\/\//) == 0 &&
    !!(domain.match(domain_to_match))
  end

  def is_youtube_url?
    is_domain? 'youtube.com'
  end

  def is_vimeo_url?
    is_domain? 'vimeo.com'
  end

  def process_title
    title = Title.where(title: @text).first
    if title
      case title.titleable
      when Page
        "<a href='/pages/#{title.slug}' data-page>#{@text}</a>"
      when CollectionItem
        "<a href='/collection_items/#{title.slug}' data-collection-item>#{@text}</a>"
        when Resource
          "<a href='/resources/#{title.slug}' data-resource>#{@text}</a>"
      end
    else
      if /^_/ =~ @text
        "<a href='/resources/new?resource_title=#{@text}' data-new-resource>#{@text}</a>"
      else
        "<a href='/pages/new?page_title=#{@text}' data-new-page>#{@text}</a>"
      end
    end
  end

  def process_url_without_text
    "<a href='#{@text}' external-link>#{@text}</a>"
  end

  def process_url_with_text
    "<a href='#{@first}' external-link>#{@rest}</a>"
  end

  #TODO refactor
  def process_rel_url
    @first.gsub!(/rel:\/\//, ENV['SITE']+'/')
    process_url
  end

  def is_rel_url?
    !! (@first =~ /^rel:\/\//)
  end

  def process_url
    @rest ? process_url_with_text : process_url_without_text
  end

  def process_image_url_without_width
    "<img src='#{@text}'/>"
  end

  def process_image_url_with_width
    "<img src='#{@first}' style='width: #{@rest}px;'/>"
  end

  def process_resource_image
    "<ing src=#{@rest.split(' ')[0]}' style='width: #{rest.split(' ')[1]}px;'/>"
  end

  def process_reosurce_image_with_width
    "<ing src=#{rest.split(' ')[0]}' />"
  end

  def process_image_url
    @rest ? process_image_url_with_width : process_image_url_without_width
  end

  def process_youtube_url
    uri    = URI.parse(@first)
    params = Hash[uri.query.split('&').map{|p| p.split('=')}] if uri.query

    if params
      process_video_url("youtube.com/embed/#{params['v']}")
    else
      process_url
    end
  end

  def process_vimeo_url
    uri = URI.parse(@first)
    id = uri.path.split('/').last

    if id
      process_video_url("player.vimeo.com/video/#{id}")
    else
      process_url
    end
  end

  def process_video_url(video_url)
    @rest &&= @rest.split(' ', 2)[0]
    @rest ||= '400'
    @rest = 640 if @rest.to_i > 640
    aspect_ratio = 0.5625
    "<iframe src='//#{video_url}' width='#{@rest}' height='#{(@rest.to_i * aspect_ratio).ceil}' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>"
  end

  def output_type
    if image_url? || is_youtube_url? || is_vimeo_url?
      :in_div__hyperlink
    else
      :in_line_hyperlink
    end
  end

  def process
    if is_rel_url?
      process_rel_url

    elsif page_title?
      process_title

    elsif image_url?
      process_image_url

    elsif is_youtube_url?
      process_youtube_url

    elsif is_vimeo_url?
      process_vimeo_url

    else
      process_url
    end
  end

  def process_summary_image
    "<img src=#{@text} style='height:50px;'/>"
  end

  def process_summary_video
     "<span style='color:gray;background-color:whitesmoke;'>&nbsp;includes a <a href=#{@text}>video</a> here&nbsp;<span>"
     # "[ includes <a href=#{@text}>video</a> ]"
  end

end