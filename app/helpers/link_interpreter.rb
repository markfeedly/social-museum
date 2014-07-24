require 'uri'
require 'pp'

class LinkInterpreter

  def url
    @first
  end

  def initialize text
    @text = text.strip
    @first, @rest = @text.split(/ /, 2)
    @rest.strip! if @rest
  end

  def url?
    @uri = URI.parse(@first)
    valid_scheme? && valid_host?
  rescue URI::BadURIError, URI::InvalidURIError
    false
  end

  def page_title?
    ! url?
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
    url_suffix? && ( !!(@first =~ /\.png$/) || !!(@first =~ /\.jpg$/) || !!(@first =~ /\.jpeg$/))
  end

  def domain
    return nil unless url?
    d = @first.gsub(/https?:\/\//, '')
    d.gsub!(/\/.*/, '')
    d
  end

  #TODO test this
  def is_domain? domain_to_match
    return false if (@first =~ /https?\:\/\//) != 0
    !!(domain.match(domain_to_match))
  end

  def is_youtube_url?
    is_domain? 'youtube.com'
  end

  def is_vimeo_url?
    is_domain? 'vimeo.com'
  end

  def process_page_title
    pg = Page.where(title: @text).first
    if pg
      "<a href='/pages/#{pg.slug}' data-page>#{@text}</a>"
    else
      "<a href='/pages/new?page_title=#{@text}' data-new-page>#{@text}</a>"
    end
  end

  def process_url_without_text
    "<a href='#{@text}' external-link>#{@text}</a>"
  end

  def process_url_with_text
    "<a href='#{@first}' external-link>#{@rest}</a>"
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

  def process_image_url
    @rest ? process_image_url_with_width : process_image_url_without_width
  end

  def process_youtube_url
    uri = URI.parse(@first)
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
    aspect_ratio = 0.5625
    "<iframe src='//#{video_url}' width='#{@rest}' height='#{(@rest.to_i * aspect_ratio).ceil}' frameborder='0' allowfullscreen sandbox='allow-scripts allow-same-origin'></iframe>"
  end

  def output_type
    return :in_div__hyperlink if image_url? || is_youtube_url? || is_vimeo_url?
    :in_line_hyperlink
  end

  def process
    return process_page_title  if page_title?
    return process_image_url   if image_url?
    return process_youtube_url if is_youtube_url?
    return process_vimeo_url   if is_vimeo_url?
    process_url
  end

end