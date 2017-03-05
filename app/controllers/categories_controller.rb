class CategoriesController < ApplicationController

  def get_categorized(clazz)
    cat = params[:id]
    cat_all = params[:category_id]
    cat ? Category.find_categorized(cat, clazz) : Category.find_categorized_including_child_categories(cat_all, clazz)
  end


  expose(:categorised_collection_items) { get_categorized(CollectionItem) }
  expose(:categorised_pages)            { get_categorized(Page) }
  expose(:categorised_resources)        { get_categorized(Resource) }

  expose(:paginated_collection_items) { Kaminari.paginate_array(categorised_collection_items).page(params[:page]).per(10) }
  expose(:paginated_pages)            { Kaminari.paginate_array(categorised_pages           ).page(params[:page]).per(10) }
  expose(:paginated_resources)        { Kaminari.paginate_array(categorised_resources       ).page(params[:page]).per(10) }

  expose(:ci_count) { categorised_collection_items.count }
  expose(:p_count) { categorised_pages.count }
  expose(:r_count) { categorised_resources.count }


  expose(:none)     { ci_count + p_count + r_count == 0 }

  # calculate which tab should be shown aka active

  expose(:ci_tab_active) { ci_count > 0 ? 'active' : '' }
  expose(:p_tab_active)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_tab_active)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

end