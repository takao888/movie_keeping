Rails.application.routes.draw do
  root to: "tops#index"
  resources :tops, only: :index
  resources :posts
end
