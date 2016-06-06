class ContentHtmlGenerator

  @@link = /\[([^\]]*)\]/

  @@open_double_square_brackets_pattern  = /[\[\\]\[/
  @@close_double_square_brackets_pattern = /[\]\\]\]/
  @@open_double_square_invisible = '(un78iJKlikely('
  @@close_double_square_invisible = ')un78iJKlikely)'

  @@open_double_square_invisible_pattern  = /\(un78iJKlikely\(/
  @@close_double_square_invisible_pattern = /\)un78iJKlikely\)/
  @@open_double_square_visible  = '['
  @@close_double_square_visible = ']'
  
  

  def self.generate_full(page_or_collection_item)

    new_markdown = ContentHtmlGenerator.chomp_this(page_or_collection_item)
    new_markdown.gsub!(@@open_double_square_brackets_pattern) {@@open_double_square_invisible}
    new_markdown.gsub!(@@close_double_square_brackets_pattern){@@close_double_square_invisible}

    new_markdown.gsub!(@@link){LinkInterpreter.new($1).process}

    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(), extensions = {})
    rendered = markdown_renderer.render(new_markdown)

    rendered.gsub!(@@open_double_square_invisible_pattern) {@@open_double_square_visible}
    rendered.gsub!(@@close_double_square_invisible_pattern){@@close_double_square_visible}
    rendered.html_safe
  end

  def self.generate_with_small_images(page_or_collection_item)
    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}),
                                                extensions = {})
    new_markdown = ContentHtmlGenerator.chomp_this(page_or_collection_item).gsub(/\[([^\]]*)\]/) do
                                          li = LinkInterpreter.new($1)
                                          if li.image_url?
                                            li.process_summary_image
                                          elsif li.is_youtube_url? || li.is_vimeo_url?
                                            li.process_summary_video
                                          else
                                            li.process
                                          end
                                        end

    markdown_renderer.render(new_markdown).html_safe
  end

  def self.page_image(page_or_collection_item)
    image = nil
    ContentHtmlGenerator.chomp_this(page_or_collection_item).gsub(/\[([^\]]*)\]/) do
      li = LinkInterpreter.new($1)
      image = li.url if ! image && li.image_url?
    end
    image = page_or_collection_item.resources.first.source if !image && page_or_collection_item.resources.first
    image
  end

  def self.chomp_this(page_or_collection_item)
    if page_or_collection_item.respond_to?(:content)
      page_or_collection_item.content
    else
      page_or_collection_item.description
    end
  end

end