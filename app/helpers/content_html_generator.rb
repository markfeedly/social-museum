class ContentHtmlGenerator
  def self.generate_full(page_or_collection_item)

    new_markdown = ContentHtmlGenerator.chomp_this(page_or_collection_item).gsub(/\[([^\]]*)\]/) { LinkInterpreter.new($1).process }

    markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(),
                                                    extensions = {})
    markdown_renderer.render new_markdown

  end

  def self.generate_part(page_or_collection_item)
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

    markdown_renderer.render(new_markdown)

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