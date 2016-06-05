class SubscriptionsController < ApplicationController

  expose(:user){ current_user }
  expose(:page){ Page.find(params[:id]) }
  expose (:page_subscriptions){ Page.select{|p| p.subscribers.include?(user) }.sort {|a,b| a.name <=> b.name} }
  expose (:collection_item_subscriptions){
    CollectionItem.select{|ci| ci.subscribers.include?(user) }.sort {|a,b| a.name <=> b.name}
  }

  def index
  end

  def delete_subscription_on_page
    page.unsubscribe(user)
    redirect_to subscriptions_path
  end

  def delete_all_subscriptions
    Page.select{|p| p.subscribers.include?(user)}.each{|p|p.unsubscribe(user)}
    redirect_to subscriptions_path
  end
end