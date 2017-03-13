 class CollectionItemsController < ApplicationController
  respond_to :html

  include CheckConflictingChanges

  expose(:collection_item, attributes: :collection_item_params, finder: :find_by_slug)
  expose(:collection_items)
  expose(:paginated_collection_items) { collection_items.page(params[:page]).per(10)}
  #todo following does not have correct times
  expose(:collection_item_history) do
    Kaminari.paginate_array(collection_item.load_versions).page(params[:page_ci]).per(10)
  end

  expose(:want_title) { params[:collection_item][:title_attributes][:title] || '' }
  expose(:want_item_number) { params[:collection_item][:item_number] || '' }
  expose(:want_location) { params[:collection_item][:location] || '' }
  expose(:want_description) { params[:collection_item][:description] || '' }
  expose(:want_str_categories) { params[:collection_item][:categories_as_str] || '' }
  expose(:want_str_tags) { params[:collection_item][:tags_as_str] || '' }

  authorize_actions_for CollectionItem

  def show
    respond_with(collection_item)
  end

  def new
    collection_item.build_title
    respond_with(collection_item)
  end

  def create
    collection_item.creator = current_user
    collection_item.name = params[:collection_item][:title_attributes][:title]
    collection_item.logged_user_id = current_user.id
    collection_item.user_id = current_user.id
    if collection_item.valid?
      collection_item.set_tags_from_string( params[:collection_item][:tags_as_str] )
      collection_item.set_categories_from_string( params[:collection_item][:categories_as_str] )
      collection_item.save
    end
    respond_with(collection_item)
  end

  def edit
    respond_with(collection_item)
  end

  def update
    collection_item.last_editor = current_user
    collection_item.name = params[:collection_item][:title_attributes][:title]
    collection_item.logged_user_id = current_user.id
    begin
      last_saved_tags       = collection_item.tags_as_str
      last_saved_categories = collection_item.categories_as_str
      collection_item.set_tags_from_string( params[:collection_item][:tags_as_str] )
      collection_item.set_categories_from_string( params[:collection_item][:categories_as_str] )
      collection_item.update_attributes(collection_item_params)

      respond_with(collection_item)
    rescue => error
      if error.instance_of?(ActiveRecord::StaleObjectError)
        if changed_collection_item( collection_item )
          flash[:warning] = 'Another user has made a conflicting edit, you can use this form to resolve the differences and save the collection_item'
          collection_item.set_tags_from_string( last_saved_tags )
          collection_item.set_categories_from_string( last_saved_categories )
          collection_item.reload
          render 'collection_items/edit_with_conflicts'
        else
          render 'collection_items/show'
        end
      else
        raise "Error during collection_item#update: #{error}"
      end
    end
  end

  def index
    respond_with(collection_items)
  end

  def destroy
    collection_item.destroy
    respond_with(collection_item)
  end

  def subscribe
    collection_item.subscribe(current_user)
    redirect_to collection_item_path(collection_item)
  end

  def unsubscribe
    collection_item.unsubscribe(current_user)
    redirect_to collection_item_path(collection_item)
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:categories,
                                            :description,
                                            :item_number,
                                            :location,
                                            :lock_version,
                                            # :name, #todo dont think this is needed
                                            :tags,
                                            title_attributes: [:title, :id])
  end
end
