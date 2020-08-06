# frozen_string_literal: true

Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  
    get "/login", to:"sessions#new"
    post "/login", to: "sessions#create"
    
    get "/help" , to:"static_pages#help"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    delete "/logout", to: "sessions#destroy"
    resources :blogs
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
