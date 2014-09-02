class CollectionItemsController < ApplicationController
  respond_to :html

  expose(:collection_item, attributes: :collection_item_params, finder: :find_by_slug)
  expose(:collection_items)
  expose(:collection_item_states) do
    number_of_versions = collection_item.versions.count
    arr = []
    for i in 1..number_of_versions do
      arr.append collection_item.version(i)
    end
    Kaminari.paginate_array(arr).page(params[:page_ci]).per(2)
  end

  authorize_actions_for CollectionItem

  def show
    respond_with(collection_item)
  end

  def new
    collection_item.build_title
    respond_with(collection_item)
  end

  def create
    collection_item.save
    respond_with(collection_item)
  end

  def edit
    respond_with(collection_item)
  end

  def update
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

  private

  def collection_item_params
    params.require(:collection_item).permit(:description,
                                            :item_number, :location,
                                            title_attributes: [:title, :id])
  end
end
