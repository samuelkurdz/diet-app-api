Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'users/index';
  resources :users, only: :index
  resources :countries, only: [:index, :create]
end
