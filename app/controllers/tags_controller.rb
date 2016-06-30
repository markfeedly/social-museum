class TagsController < ApplicationController

  expose(:tag_is) { Tag.where(name: params[:id]).first }
  expose(:none)     { tag_is ? false : true  }

  expose(:tagged_collection_items) { tag_is ? tag_is.collection_items : [] }
  expose(:tagged_pages) { tag_is ? tag_is.pages : [] }
  expose(:tagged_resources) { tag_is ? tag_is.resources : [] }

  expose(:paginated_tagged_collection_items) { Kaminari.paginate_array(tagged_collection_items).page(params[:page]).per(10) }
  expose(:paginated_tagged_pages) { Kaminari.paginate_array(tagged_pages).page(params[:page]).per(10) }
  expose(:paginated_tagged_resources) { Kaminari.paginate_array(tagged_resources).page(params[:page]).per(10) }

  expose(:ci_count) { tag_is ? tagged_collection_items.count : 0 }
  expose(:p_count)  { tag_is ? tagged_pages.count : 0 }
  expose(:r_count)  { tag_is ? tagged_resources.count : 0 }

  expose(:ci_class) { ci_count > 0 ? 'active' : '' }
  expose(:p_class)  { ci_count == 0 && p_count > 0 ? 'active' : '' }
  expose(:r_class)  { ci_count == 0 && p_count == 0 && r_count > 0 ? 'active' : '' }

  def show
  end

end