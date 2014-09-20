class CollectionItemsController < ApplicationController
  respond_to :html

  expose(:collection_item, attributes: :collection_item_params, finder: :find_by_slug)
  expose(:collection_items)
  expose(:paginated_collection_items) { collection_items.page(params[:page]).per(10)}
  expose(:collection_item_history) do
    Kaminari.paginate_array(get_versions).page(params[:page_ci]).per(10)
  end

  authorize_actions_for CollectionItem

  def get_versions
    version_numbers = collection_item.versions.map{|v| v.version_number}.sort.reverse
    version_numbers.each.map{|v_num|collection_item.version(v_num)}
  end

  def show
    respond_with(collection_item)
  end

  def new
    collection_item.build_title
    respond_with(collection_item)
  end

  def create
    collection_item.logged_user_id = current_user.id
    collection_item.save
    respond_with(collection_item)
  end

  def edit
    respond_with(collection_item)
  end

  def update
    collection_item.logged_user_id = current_user.id
    collection_item.update_attributes(collection_item_params)
    respond_with(collection_item)
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
                                            :tags,
                                            title_attributes: [:title, :id])
  end
end
