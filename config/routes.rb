VirtualMuseum::Application.routes.draw do

  root :to => "home#index"

  resources :categories, only: :show do
    get :show_full
  end

  resources :collection_items do
    resources :comments, only: [:create, :destroy, :approve, :disapprove]
    member do
      get :subscribe
      get :unsubscribe
    end
  end

  resources :comments, only: :destroy do
    post :approve
    post :disapprove
  end

  resources :help, only: [:index]

  resources :pages do
    resources :comments, only: [:create, :destroy, :approve, :disapprove]
    member do
      get :subscribe
      get :unsubscribe
    end
    collection{ get :install }
  end

  resources :recent, only: [:collection_items, :pages, :resources] do
    collection do
      get :collection_items
      get :pages
      get :resources
    end
  end

  resources :resources do
    resources :comments, only: [:create, :destroy, :approve, :disapprove]
    member do
      get :subscribe
      get :unsubscribe
      get :edit_with_conflicts
    end
    get 'P:resources', :action => :index, :on => :collection
    get :autocomplete_resourceable_title, :on => :collection
  end

  resources :subscriptions, only: :index do
    collection do
      delete 'delete_subscription_on_page/:id', action: 'delete_subscription_on_page', as: 'delete_subscription_on_page'
      get 'delete_all_page_subscriptions'
      get 'delete_all_collection_item_subscriptions'
      get 'delete_all_resource_subscriptions'
      get 'delete_all_subscriptions'
    end
  end

  #delete '/delete_page_subscription_for_current_user/:id', controller: 'subscriptions', action: 'delete_subscription_on_page', as: 'delete_page_subscription_for_current_user'

  resources :table_of_contents, only: [:index]

  resources :tags, only: [:show]

  devise_for :users, :controllers => {:registrations => "registrations",
                                      :omniauth_callbacks => "omniauth_callbacks" }

  resources :users



  get '/get_uploaded_file/:type/:id/:name', to: 'resources#get_uploaded_file', as: 'uploaded'

end

