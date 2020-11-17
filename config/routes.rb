Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  post "users", to: "users#create"
  
  resources :plans, except: [:index, :show] do
    resources :schedules, except: [:show] do
      collection do
        get "day2"
        get "day3"
        get "day4"
        get "day5"
        get "day6"
        get "day7"
      end
    end
  end
end
