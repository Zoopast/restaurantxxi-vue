Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  post 'recipes/update_recipe', to: 'recipes#update_recipe'
    #controllers: {
    #  registrations: 'users/registrations',
    #  sessions: 'users/sessions'
    # }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
