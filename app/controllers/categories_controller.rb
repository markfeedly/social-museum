class CategoriesController < ApplicationController

  expose(:category_is) { Category.where(name: params[:id]).first }
  expose(:all_category_is) { Category.where(name: params[:category_id]).first }

  expose(:all_categorised_collection_items) { all_category_is ? CollectionItem.all.select { |ci| ci.in_category_and_its_children?(params[:category_id]) ? ci : nil } : [] }
  expose(:paginated_all_collection_items) { Kaminari.paginate_array(all_categorised_collection_items).page(params[:page]).per(10) }
  expose(:all_ci_count) { all_category_is ? all_categorised_collection_items.count : 0 }

  expose(:categorised_collection_items) { category_is ? category_is.collection_items.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_categorised_collection_items) { Kaminari.paginate_array(categorised_collection_items).page(params[:page]).per(10) }
  expose(:ci_count) { category_is ? categorised_collection_items.count : 0 }


  expose(:all_categorised_pages) { all_category_is ? Page.all.select { |ci| ci.in_category_and_its_children?(params[:category_id]) ? ci : nil } : [] }
  expose(:paginated_all_categorised_pages) { Kaminari.paginate_array(all_categorised_pages).page(params[:page]).per(10) }
  expose(:all_p_count) { all_category_is ? all_categorised_pages.count : 0 }

  expose(:categorised_pages) { category_is ? category_is.pages.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_categorised_pages) { Kaminari.paginate_array(categorised_pages).page(params[:page]).per(10) }
  expose(:p_count) { category_is ? categorised_pages.count : 0 }

  expose(:all_categorised_resources) { all_category_is ? Resource.all.select { |ci| ci.in_category_and_its_children?(params[:category_id]) ? ci : nil } : [] }
  expose(:paginated_all_resources) { Kaminari.paginate_array(all_categorised_resources).page(params[:page]).per(10) }
  expose(:all_r_count) { all_category_is ? all_categorised_resources.count : 0 }

  expose(:categorised_resources) { category_is ? category_is.resources.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_categorised_resources) { Kaminari.paginate_array(categorised_resources).page(params[:page]).per(10) }
  expose(:r_count) { category_is ? categorised_resources.count : 0 }

  expose(:none)     { category_is ? false : true }
  expose(:all_none) { all_category_is ? false : true }

  expose(:all_ci_class) { all_ci_count > 0 ? 'active' : '' }
  expose(:all_p_class)  { all_ci_count == 0 && all_p_count > 0 ? 'active' : '' }
  expose(:all_r_class)  { all_ci_count == 0 && all_p_count == 0 && all_r_count > 0 ? 'active' : '' }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

  expose(:all_ci_class) { all_ci_count > 0 ? 'active' : '' }
  expose(:all_p_class)  { all_ci_count == 0 && all_p_count > 0 ? 'active' : '' }
  expose(:all_r_class)  { all_ci_count == 0 && all_p_count == 0 && all_r_count > 0 ? 'active' : '' }

end