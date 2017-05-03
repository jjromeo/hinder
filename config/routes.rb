Rails.application.routes.draw do
  devise_for :users
  root to: 'photos#index'
  resources :photos, only: :index
  resources :votes, only: :create

  resources :users, only: :show do
    resources :photos, only: [:new, :create]
  end
end
