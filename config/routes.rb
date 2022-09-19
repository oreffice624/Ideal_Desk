Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :desks do
    resources :reviews, only: [:index, :create]
  end
end
