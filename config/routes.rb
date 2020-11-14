Rails.application.routes.draw do
  get 'toppages/index'
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  post "users", to: "users#create"
  
  resources :plans, except: [:index]
end
