# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    namespace :contracts do
      resources :signatures, only: %i[update destroy]
      resources :approvals, only: %i[update destroy]
    end
    resources :users, only: %i[index]
  end

  namespace :api do
    namespace :contracts do
      resources :signatures, only: %i[update destroy]
      resources :approvals, only: %i[update destroy]
    end
  end

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
