Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "users#login"
  post "/sign_up", to: "users#create"
  get "/auto_login", to: "users#auto_login"
  resources :vulnerabilities, only: [:index, :show, :create, :destroy]
  resources :change_histories, only: [:index, :show]
end
