Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: "home#index"
  resources :users
  namespace :admin do
    resources :users, only: [:index, :new, :create, :show,  :edit, :destroy]
  end
  
  resources :desks do
    resources :reviews
  end
end

# , only: [:index, :create, :edit]
