Rails.application.routes.draw do
  devise_for :users
  root to: 'photos#index'
  resources :photos, only: :index
  resources :votes, only: :create

  resources :users, only: :show do
    resources :photos, only: [:new, :create] do
      get :for_voting, on: :collection
    end
  end
end
