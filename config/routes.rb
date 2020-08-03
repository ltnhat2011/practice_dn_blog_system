# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to:"sessions#new"
  post "/login", to: "sessions#create"
  root "static_pages#home"
  get "/help" , to:"static_pages#help"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
