Rails.application.routes.draw do
 
  resources :users, :chatrooms
  resources :messages, only: :create
  root "chatrooms#index"

  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "create_session"
  get "logout", to: "sessions#destroy", as: "logout"
end
