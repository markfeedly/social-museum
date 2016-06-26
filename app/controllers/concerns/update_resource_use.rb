module UpdateResourceUse
  extend ActiveSupport::Concern

  def make_menu_items
    list = Title.where(Title.arel_table[:title].matches("%#{params[:term]}%")).pluck(:title, :id)
    list.reject! { |title_str, id| t = Title.find_by_id(id); t.title == title_str && t.titleable_type == 'Resource' if t }
    list.collect do |i|
      title = i[0]
      ttl = Title.find(i[1].to_i)
      res_class_abbr = ttl.titleable_type == 'Page' ? 'p' : 'c'
      res_id = ttl.titleable_id.to_s
      puts '=== ' + title + '( ' + res_class_abbr + res_id + ')'
      title + ' {' + res_class_abbr + res_id + '}'
    end
  end

  def update_resource_use
    params[:resource][:resource_usages_attributes].collect { |key, value| value }.each do |selection|
      case [selection['_destroy'] == '1' ? 'destroy' : 'no destroy',
            selection['id'] == nil ? 'add' : 'allow destroy']

        when ['destroy', 'allow destroy']
          typ, r_id = extract_class_and_id(selection)
          res_use = ResourceUsage.find_by(resource_id: resource.id, resourceable_id: r_id, resourceable_type: typ)
          res_use.delete if res_use

        when ['destroy', 'add']

        when ['no destroy', 'add']
          if selection['page_title'] != ''
            typ, r_id = extract_class_and_id(selection)

            puts "== selection #{selection}"
            puts "== typ #{typ}"
            puts "== rid #{r_id}"
            resourceable = (typ == 'CollectionItem' ? CollectionItem.find(r_id) : Page.find(r_id))
            puts "== rid #{resourceable}"
            if ResourceUsage.where(resource_id: resource.id, resourceable_id: r_id, resourceable_type: typ).empty?
              ResourceUsage.create(resource_id: resource.id, resourceable_id: r_id, resourceable_type: typ)
            end
          end
          ResourceUsage.where(resource_id: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resource_id: nil).blank?
          ResourceUsage.where(resourceable_id: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resourceable_id: nil).blank?
          ResourceUsage.where(resourceable_type: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resourceable_type: nil).blank?

        when ['no destroy', 'allow destroy']

      end
    end
  end

  private

  def extract_class_and_id(selection)
    typ = selection['page_title'] =~ / .c\d+.$/ ? 'CollectionItem' : 'Page'
    r_id = selection['page_title'].match(/ {[pc](\d+)}$/)[1].to_i
    [typ, r_id]
  end

end