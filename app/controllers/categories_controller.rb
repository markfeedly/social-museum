class CategoriesController < ApplicationController

  expose(:category_is) { Category.where(name: params[:id]).first }

  def get_categorized(cat, cat_for_childs)
    cat ? Category.find_categorized(cat) : Category.find_categorized_including_child_categories(cat_for_childs, CollectionItem)
  end

  expose(:categorised_collection_items) { get_categorized(category_is, all_category_is) }
  expose(:all_categorised_collection_items) { get_categorized(category_is, all_category_is) }

  expose(:paginated_categorised_collection_items) { Kaminari.paginate_array(categorised_collection_items).page(params[:page]).per(10) }
  expose(:paginated_all_collection_items) { Kaminari.paginate_array(categorised_collection_items).page(params[:page]).per(10) }





  expose(:all_category_is) { Category.where(name: params[:category_id]).first || Category.new(name: params[:category_id]) }

  expose(:all_ci_count) { all_category_is ? all_categorised_collection_items.count : 0 }

  expose(:ci_count) { category_is ? categorised_collection_items.count : 0 }


  expose(:all_categorised_pages) { all_category_is ? Category.find_categorized_including_child_categories(params[:category_id], Page) : [] }
  expose(:paginated_all_categorised_pages) { Kaminari.paginate_array(all_categorised_pages).page(params[:page]).per(10) }
  expose(:all_p_count) { all_category_is ? all_categorised_pages.count : 0 }

  expose(:categorised_pages) { category_is ? category_is.pages.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_categorised_pages) { Kaminari.paginate_array(categorised_pages).page(params[:page]).per(10) }
  expose(:p_count) { category_is ? categorised_pages.count : 0 }

  expose(:all_categorised_resources) { all_category_is ? Category.find_categorized_including_child_categories(params[:category_id], Resource) : [] }
  expose(:paginated_all_resources) { Kaminari.paginate_array(all_categorised_resources).page(params[:page]).per(10) }
  expose(:all_r_count) { all_category_is ? all_categorised_resources.count : 0 }

  expose(:categorised_resources) { category_is ? category_is.resources.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : [] }
  expose(:paginated_categorised_resources) { Kaminari.paginate_array(categorised_resources).page(params[:page]).per(10) }
  expose(:r_count) { category_is ? categorised_resources.count : 0 }

  expose(:none)     { ci_count + p_count + r_count == 0 }
  expose(:all_inc_children_none) { all_ci_count + all_p_count + all_r_count == 0  }

  # calculate which tab should be shown aka active

  expose(:ci_tab_active) { ci_count > 0 ? 'active' : '' }
  expose(:p_tab_active)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_tab_active)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

  expose(:all_ci_tab_active) { all_ci_count > 0 ? 'active' : '' }
  expose(:all_p_tab_active)  { all_ci_count == 0 && all_p_count > 0 ? 'active' : '' }
  expose(:all_r_tab_active)  { all_ci_count == 0 && all_p_count == 0 && all_r_count > 0 ? 'active' : '' }

end