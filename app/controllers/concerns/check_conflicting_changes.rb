module CheckConflictingChanges
=begin
  def changed_collection_item?(coll_item)

    desired_tags        = clean_str( params[:collection_item][:tags_as_str] )
    desired_categories  = clean_str( params[:collection_item][:categories_as_str] )
    desired_location    = params[:collection_item][:location]
    desired_item_number = params[:collection_item][:item_number]
    desired_description = params[:collection_item][:description]

    coll_item.tags_as_str != desired_tags ||
        coll_item.categories_as_str != desired_categories ||
        coll_item.location != desired_location ||
        coll_item.item_number != desired_item_number ||
        coll_item.description != desired_description
  end
=end

  def changed_object?( obj, param_key )
    change = false
    case param_key
      when :resource
        change = changed_resource_specific_part?(obj)
      when :collection_item
        change = changed_collection_item_specific_part?(obj)
    end
    change || changed_common_part?(obj, param_key)
  end

  def changed_common_part?( obj, param_key )
    desired_tags        = clean_str( params[param_key][:tags_as_str] )
    desired_categories  = clean_str( params[param_key][:categories_as_str] )
    desired_description = params[param_key][:description]
    obj.tags_as_str != desired_tags ||
        obj.categories_as_str != desired_categories ||
        obj.description != desired_description
  end

  def changed_collection_item_specific_part?(coll_item)
    desired_location    = params[:collection_item][:location]
    desired_item_number = params[:collection_item][:item_number]
    coll_item.location != desired_location || coll_item.item_number != desired_item_number
  end

  def changed_resource_specific_part?(res)
    raise "in changed_resource_specific_part?"
  end

  private

  def clean_str(str)
    str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}.join(', ')
  end
end