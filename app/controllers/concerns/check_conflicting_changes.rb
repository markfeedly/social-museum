module CheckConflictingChanges
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

  private

  def clean_str(str)
    str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}.join(', ')
  end
end