class CollectionItemsController < ApplicationController
  respond_to :html

  expose(:collection_item, attributes: :collection_item_params, finder: :find_by_slug)
  expose(:collection_items)

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

  def index
    respond_with(collection_items)
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:description,
                                            :item_number, :location,
                                            title_attributes: [:title, :id])
  end
end
