module ApplicationHelper


  def category_list(categories)
    categories.map do |cat|
      Category.category_trail(cat, :isa).map{|c| link_to c, category_path(c)}.join(' > ')
    end
  end

  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end


  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end