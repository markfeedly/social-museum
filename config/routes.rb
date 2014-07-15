VirtualMuseum::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  resources :pages do
    resources :comments
    member do
      get :subscribe
      get :unsubscribe
      get 'unsubscribe-via-email' => :unsubscribe_via_email, as: :unsubscribe_via_email
    end
  end
  resources :resources

  resources :tags,       only: [:show]
  resources :categories, only: [:show]
  resources :page_types, only: [:show]
end

