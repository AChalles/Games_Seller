Rails.application.routes.draw do
  get 'order/index'
  get 'order/show'
  get 'user/index'
  get 'companies/index'
  get 'platform/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :genres
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
