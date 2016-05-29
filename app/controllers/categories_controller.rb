class CategoriesController < ApplicationController
  
  expose(:category_is) { Category.where(name: params[:id]).first }

  expose(:categorised_collection_items) do
    collection = category_is ? category_is.collection_items.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end
  expose(:categorised_pages) do
    collection = category_is ? category_is.pages.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end
  expose(:categorised_resources) do
    collection = category_is ? category_is.resources.select { |ci| ci.has_category?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end

  expose(:ci_count) { category_is ? category_is.collection_items.count : 0 }
  expose(:p_count)  { category_is ? category_is.pages.count : 0 }
  expose(:r_count)  { category_is ? category_is.resources.count : 0 }
  expose(:none)     { category_is ? true : false }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }


end