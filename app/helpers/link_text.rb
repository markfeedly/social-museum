class LinkText

  def initialize(text)
    @text = text.strip
  end

  def width
    potential_width = @text.split(/ +/)[-1].to_i
    potential_width > 0 ? potential_width : nil
  end

  def text_no_width
    width ? @text.gsub(/ +\d+$/,'') : @text
  end

  def asset_reference?
    @text =~ /^__/ ? true : false
  end

  def title
    asset_reference? ? text_no_width[1..-1] : text_no_width
  end

  def asset_url
    resource = Resource.find_by_title(title)
    if resource.url =~ /^\//
      blank, type, id, name = resource.url.split('/')
      Rails.application.routes.url_helpers.uploaded_path(type, id, name)
    else
      resource.url
    end
  end

end