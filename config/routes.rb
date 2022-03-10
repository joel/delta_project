Rails.application.routes.draw do

  resources :users do
    resources :contracts, except: [:index]
  end

  resources :posts do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
