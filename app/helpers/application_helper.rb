module ApplicationHelper

  def no_image
    full_dir_path = ENV['PUBLIC_UPLOAD_DIR']+'/images/0/'
    full_file_path = full_dir_path+'no_image.png'
    if ! File.file?(full_file_path)
      FileUtils::makedirs(full_dir_path)
      FileUtils::copy(Rails.root+'app/assets/images/no_image.png', full_file_path)
    end
    '/get_uploaded_file/images/0/no_image.png'.html_safe
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

  def category_list(categories)
    categories.map do |cat|
      Category.category_trail(cat, :isa).map{|c| link_to c, category_path(c)}.join(' > ')
    end.join(', ').html_safe
  end

  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end
end