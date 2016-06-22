class TagsController < ApplicationController

  expose(:tag_is) { Tag.where(name: params[:id]).first }
  expose(:all_tag_is) { Tag.where(name: params[:tag_id]).first }

  expose(:all_tagged_collection_items) { all_tag_is ? CollectionItem.all.select { |ci| ci.in_tag_and_its_children?(params[:tag_id]) ? ci : nil } : [] }
  expose(:paginated_all_collection_items) { Kaminari.paginate_array(all_tagged_collection_items).page(params[:page]).per(10) }
  expose(:all_ci_count) { all_tag_is ? all_tagged_collection_items.count : 0 }

  expose(:tagged_collection_items) { tag_is ? tag_is.collection_items.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_tagged_collection_items) { Kaminari.paginate_array(tagged_collection_items).page(params[:page]).per(10) }
  expose(:ci_count) { tag_is ? tagged_collection_items.count : 0 }


  expose(:all_tagged_pages) { all_tag_is ? Page.all.select { |ci| ci.in_tag_and_its_children?(params[:tag_id]) ? ci : nil } : [] }
  expose(:paginated_all_tagged_pages) { Kaminari.paginate_array(all_tagged_pages).page(params[:page]).per(10) }
  expose(:all_p_count) { all_tag_is ? all_tagged_pages.count : 0 }

  expose(:tagged_pages) { tag_is ? tag_is.pages.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_tagged_pages) { Kaminari.paginate_array(tagged_pages).page(params[:page]).per(10) }
  expose(:p_count) { tag_is ? tagged_pages.count : 0 }

  expose(:all_tagged_resources) { all_tag_is ? Resource.all.select { |ci| ci.in_tag_and_its_children?(params[:tag_id]) ? ci : nil } : [] }
  expose(:paginated_all_resources) { Kaminari.paginate_array(all_tagged_resources).page(params[:page]).per(10) }
  expose(:all_r_count) { all_tag_is ? all_tagged_resources.count : 0 }

  expose(:tagged_resources) { tag_is ? tag_is.resources.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_tagged_resources) { Kaminari.paginate_array(tagged_resources).page(params[:page]).per(10) }
  expose(:r_count) { tag_is ? tagged_resources.count : 0 }

  expose(:none)     { tag_is ? true : false }
  expose(:all_none)     { all_tag_is ? true : false }

  expose(:all_ci_class) { all_ci_count > 0 ? 'active' : '' }
  expose(:all_p_class)  { all_ci_count == 0 && all_p_count > 0 ? 'active' : '' }
  expose(:all_r_class)  { all_ci_count == 0 && all_p_count == 0 && all_r_count > 0 ? 'active' : '' }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

  expose(:all_ci_class) { all_ci_count > 0 ? 'active' : '' }
  expose(:all_p_class)  { all_ci_count == 0 && all_p_count > 0 ? 'active' : '' }
  expose(:all_r_class)  { all_ci_count == 0 && all_p_count == 0 && all_r_count > 0 ? 'active' : '' }

  def show
  end

end