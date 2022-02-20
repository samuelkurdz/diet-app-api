Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'users/index';
    namespace :v1 do
      resources :users, only: [:index, :create, :destroy]
      resources :countries, only: [:index, :create]
      # resources :auth, only: [:create]
      post 'auth', to: 'authentication#create'
    end
  end
