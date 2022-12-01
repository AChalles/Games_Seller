Rails.application.routes.draw do
  root to: 'games#index'
  get 'past_order/index'
  get 'past_order/show'
  get 'order/index'
  get 'order/show'
  get 'user/index'
  get 'companies/index'
  get 'platform/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :genres
  resources :companies
  #resources :games
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  resources :games, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
