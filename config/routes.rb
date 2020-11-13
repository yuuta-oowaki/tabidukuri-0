Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: "toppages#index"
  
  get "signup", to: "users#new"
  post "users", to: "users#create"
end
