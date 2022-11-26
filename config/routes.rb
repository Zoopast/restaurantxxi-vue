Rails.application.routes.draw do
  resources :expenses
  resources :recipes
  resources :items
  resources :menus
  resources :tables
  resources :customers
  resources :reservations
  resources :finances
  resources :kitchens
  resources :inventories
  post 'recipes/update_recipe', to: 'recipes#update_recipe'
  post 'items/add_stock', to: 'items#add_stock'
  post 'menus/update_menu', to: 'menus#update_menu'
  post 'tables/update_table', to: 'tables#update_table'
  post 'customers/update_customer', to: 'customers#update_customer'
  post 'reservations/update_reservation', to: 'reservations#update_reservation'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations',
    passwords: 'clients/passwords'
  }

  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :orders
      resources :customers
      resources :tables
      resources :menus
      resources :items
      resources :recipes
      resources :expenses
      resources :finances
      post 'recipes/update_recipe', to: 'recipes#update_recipe'
      post 'items/add_stock', to: 'items#add_stock'
      post 'menus/update_menu', to: 'menus#update_menu'
      post 'tables/update_table', to: 'tables#update_table'
      post 'customers/update_customer', to: 'customers#update_customer'
      post 'reservations/update_reservation', to: 'reservations#update_reservation'
    end
  end
end
