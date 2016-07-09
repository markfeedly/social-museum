class SubscriptionsController < ApplicationController

  #todo more method calls like this in controllers before_action :authenticate_user!
  before_action :authenticate_user!

  expose(:collection_item){ CollectionItem.find(params[:id]) }
  expose(:page){ Page.find(params[:id]) }
  expose(:resource){ Page.find(params[:id]) }



  expose (:collection_item_subscriptions) { get_subscriptions_for(CollectionItem)}
  expose((:page_subscriptions)) { get_subscriptions_for(Page)}
  expose(:resource_subscriptions){ get_subscriptions_for(Resource)}

  def delete_all_collection_item_subscriptions
    unsubscribe_from(CollectionItem)
    redirect_to subscriptions_path
  end

  def delete_all_page_subscriptions
    unsubscribe_from(Page)
    redirect_to subscriptions_path
  end


  def delete_all_resource_subscriptions
    unsubscribe_from(Resource)
    redirect_to subscriptions_path
  end

  def delete_all_subscriptions
    delete_all_collection_item_subscriptions
    delete_all_page_subscriptions
    delete_all_resource_subscriptions
    redirect_to subscriptions_path
  end

  private

  #todo optimise
  def get_subscriptions_for(claz)
    claz.select{ |obj| obj.subscribers.include?(current_user) }.sort { |a, b| a.name <=> b.name }
  end

  def unsubscribe_from(claz)
    claz.select{|p| p.subscribers.include?(current_user)}.each{|p|p.unsubscribe(current_user)}
  end


end