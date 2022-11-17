Rails.application.routes.draw do
  resources :expenses
  resources :recipes
  resources :items
  resources :menus
  resources :tables
  resources :clients
  resources :reservations
  resources :finances
  post 'recipes/update_recipe', to: 'recipes#update_recipe'
  post 'items/add_stock', to: 'items#add_stock'
  post 'menus/update_menu', to: 'menus#update_menu'
  post 'tables/update_table', to: 'tables#update_table'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
end
