Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :tasks, only: [:create,:index]
  root "tasks#index"
  get "/sign_up" => "users#new", as: :sign_up
  get "/sign_in" => "sessions#new", as: :sign_in
end
