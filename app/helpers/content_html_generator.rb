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

 # -------------------------------------------------------------------------------------------------------

  def self.generate_full(page_or_collection_item)
    preprocess_and_make_markdown(page_or_collection_item){ |md| md.gsub!(@@link){LinkInterpreter.new($1).process} }
  end

  def self.generate_with_small_images(page_or_collection_item)
    preprocess_and_make_markdown(page_or_collection_item) do |md|
      md.gsub!(@@link) do
        li = LinkInterpreter.new($1)
        if li.image_url?
          li.process_summary_image
        elsif li.is_youtube_url? || li.is_vimeo_url?
          li.process_summary_video
        else
          li.process
        end
      end
    end
  end

  def self.page_image(page_or_collection_item)
    image = nil
    (page_or_collection_item.description).gsub(/\[([^\]]*)\]/) do
      li = LinkInterpreter.new($1)
      image = li.url if ! image && li.image_url?
      image = li.asset_url if ! image && li.resource_asset?
    end
    image = page_or_collection_item.resources.first.source if !image && page_or_collection_item.resources.first
    image
  end

  def self.preprocess_and_make_markdown(page_or_collection_item)
    markdown = preprocess_double_square_brackets( page_or_collection_item.description )
    yield markdown
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(), extensions = {})
    rendered = renderer.render(markdown)
    post_process_double_square_brackets(rendered).html_safe
  end

  def self.preprocess_double_square_brackets(markdown)
    markdown.gsub!(@@open_double_square_brackets_pattern) {@@open_double_square_invisible}
    markdown.gsub!(@@close_double_square_brackets_pattern){@@close_double_square_invisible}
    markdown
  end

  def self.post_process_double_square_brackets(rendered)
    rendered.gsub!(@@open_double_square_invisible_pattern) {@@open_double_square_visible}
    rendered.gsub!(@@close_double_square_invisible_pattern){@@close_double_square_visible}
    rendered
  end



end