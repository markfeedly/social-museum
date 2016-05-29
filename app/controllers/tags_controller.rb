class TagsController < ApplicationController

  expose(:tag_is) { Tag.where(name: params[:id]).first }

  expose(:tagged_collection_items) do
    collection = tag_is ? tag_is.collection_items.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end
  expose(:tagged_pages) do
    collection = tag_is ? tag_is.pages.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end
  expose(:tagged_resources) do
    collection = tag_is ? tag_is.resources.select { |ci| ci.has_tag?(params[:id]) ? ci : nil } : []
    Kaminari.paginate_array(collection).page(params[:page]).per(10)
  end

  expose(:ci_count) { tag_is ? tag_is.collection_items.count : 0 }
  expose(:p_count)  { tag_is ? tag_is.pages.count : 0 }
  expose(:r_count)  { tag_is ? tag_is.resources.count : 0 }
  expose(:none)     { tag_is ? true : false }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

end