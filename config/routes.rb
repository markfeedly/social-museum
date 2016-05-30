VirtualMuseum::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :omniauth_callbacks => "omniauth_callbacks" }

  resources :categories, only: :show do
    get :show_full
  end

  resources :collection_items do
    resources :comments, only: :create, controller: 'collection_comments'
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
    resources :comments, only: :create, controller: 'collection_comments'
    member do
      get :subscribe
      get :unsubscribe
    end
  end

  resources :recent, only: [:collection_items, :pages, :resources] do
    collection do

      get :collection_items
      get :pages
      get :resources
    end

  end

  resources :resources do
    resources :comments, only: :create, controller: 'collection_comments'
    member do
      get :subscribe
      get :unsubscribe
    end
    get 'P:resources', :action => :index, :on => :collection
    get :autocomplete_page_title, :on => :collection
  end

=begin
  resources :resources do
    get 'P:resources', :action => :index, :on => :collection
    get :autocomplete_page_title, :on => :collection
  end
=end

  resources :table_of_contents, only: [:index]

  resources :tags, only: [:show]

  resources :users

  get '/get_uploaded_file/:type/:id/:name', to: 'resources#get_uploaded_file', as: 'uploaded'

end

