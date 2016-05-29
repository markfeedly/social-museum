class TagsController < ApplicationController

  expose(:paginated_pages) { Tag.where(name: params[:id]).first.pages}

  expose(:tag_is) { Tag.where(name: params[:id]).first }

  expose(:tagged_collection_items) { Kaminari.paginate_array( (Title.all.select{|t| t.titleable.has_tag?(params[:id]) && t.titleable.class == CollectionItem ? t.titleable : nil }.collect{|t| t.titleable} )).page(params[:page]).per(10) }
  expose(:tagged_pages)            { Kaminari.paginate_array( (Title.all.select{|t| t.titleable.has_tag?(params[:id]) && t.titleable.class == Page ? t.titleable : nil }.collect{|t| t.titleable} )).page(params[:page]).per(10) }
  expose(:tagged_resources)        { Kaminari.paginate_array( (Title.all.select{|t| t.titleable.has_tag?(params[:id]) && t.titleable.class == Resource   ? t.titleable : nil }.collect{|t| t.titleable} )).page(params[:page]).per(10) }

  expose(:ci_count) { tag_is.collection_items.count }
  expose(:p_count)  { tag_is.pages.count }
  expose(:r_count)  { tag_is.resources.count }
  expose(:none)     { (ci_count + p_count + r_count ) == 0 }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

end