Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "hello#index"
  get "hello/index" => "hello#index"
  get "hello/link" => "hello#link" 
  get "tweets/index2" => "tweets#index2"
  get "calendar" => "tweets#calendar"
  resources :users, only: [:show]
  resources :tweets do
    resources :comments, only: [:create]
  end
end
