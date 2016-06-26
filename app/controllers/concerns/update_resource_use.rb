module UpdateResourceUse
  extend ActiveSupport::Concern

  def update_resource_use
    begin
      res_use_attrs = params[:resource][:resource_usages_attributes]

      res_use_attrs.collect { |k, v| v }.each do |selection|
        puts "==== sel #{selection}"
        case_control = [selection['_destroy'] == '1' ? 'destroy' : 'no destroy', selection['id'] == nil ? 'add' : 'allow destroy']
        puts "======= #{case_control}"
        case case_control

          when ['destroy', 'allow destroy']
            puts "*** in [destroy, allow destroy]"
            typ = selection['page_title'] =~ / .c\d+.$/ ? 'CollectionItem' : 'Page'
            r_id = selection['page_title'].match(/ {[pc](\d+)}$/)[1].to_i
            destroy_list = ResourceUsage.where(resource_id: resource.id, resourceable_id: r_id, resourceable_type: typ)
            puts "*--- destroy list #{destroy_list}"
            destroy_list.first.delete unless destroy_list.empty?
          when ['destroy', 'add']
            puts "*** in [destroy, add] === do nothing"
          when ['no destroy', 'add']
            puts "*** in [no destroy, add]"
            if selection['page_title'] != ''
              typ = selection['page_title'] =~ / .c\d+.$/ ? 'CollectionItem' : 'Page'
              r_id = selection['page_title'].match(/ {[pc](\d+)}$/)[1].to_i
              puts "== typ #{typ}"
              puts "== rid #{r_id}"
              resourceable = (typ == 'CollectionItem' ? CollectionItem.find(r_id) : Page.find(r_id))
              puts "== rid #{resourceable}"

              ResourceUsage.create(resource_id: resource.id, resourceable_id: r_id, resourceable_type: typ)
            end

            ResourceUsage.where(resource_id: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resource_id: nil).blank?
            ResourceUsage.where(resourceable_id: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resourceable_id: nil).blank?
            ResourceUsage.where(resourceable_type: nil).each { |ru| ru.destroy } unless ResourceUsage.where(resourceable_type: nil).blank?


          when ['no destroy', 'allow destroy']
            puts "*** in [no destroy, allow destroy] === do nothing"

        end
      end
    end
  end

end