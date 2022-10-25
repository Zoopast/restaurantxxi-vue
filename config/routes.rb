Rails.application.routes.draw do
  devise_for :users
  resources :recipes
    #controllers: {
    #  registrations: 'users/registrations',
    #  sessions: 'users/sessions'
    # }
  root 'home#index'
  get 'about', to: 'about#index'
  get 'member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
