Rails.application.routes.draw do
  get "checkout", to: "checkout#show"
  get "success", to: "checkout#success", as: "success"
  get "cancel", to: "checkout#cancel", as: "cancel"
  get 'order/index'
  get 'order/show'
  get 'user/index'
  get 'companies/index'
  get 'platform/index'
  resources :games, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  get 'pages/:permalink' => "pages#permalink", as: 'permalink'
  get 'checkout/index'
  post 'checkout/index'
  post 'checkout/update_tax', to: 'checkout#update_tax', as: 'update_tax'
  post 'games/add_to_cart/:id', to: 'games#add_to_cart', as: 'add_to_cart'
  post 'games/remove_quantity_from_cart/:id', to: 'games#remove_quantity_from_cart', as: 'remove_quantity_from_cart'
  delete 'games/remove_from_cart/:id', to: 'games#remove_from_cart', as: 'remove_from_cart'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  authenticated :user do
    root to: 'games#index', as: :root_app
  end
  resources :genres
  resources :companies
  #resources :games


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  root to: 'games#index'
end
