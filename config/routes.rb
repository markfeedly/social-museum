VirtualMuseum::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :omniauth_callbacks => "omniauth_callbacks" }

  resources :categories, only: [:show]

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

  resources :pages do
    get 'P:page_summaries', :action => :index, :on => :collection
    get ':id/P:page_states', :action => :show, :on => :collection
    resources :comments, only: :create, controller: 'page_comments'
    member do
      get :subscribe
      get :unsubscribe
      get 'unsubscribe-via-email' => :unsubscribe_via_email, as: :unsubscribe_via_email
    end
  end

  resources :recent, only: [:index]

  resources :resources do
    get 'P:resources', :action => :index, :on => :collection
    get :autocomplete_page_title, :on => :collection
  end

  resources :table_of_contents, only: [:index]

  resources :tags, only: [:show]

  resources :users
end

