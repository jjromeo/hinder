Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  
  #change devise routes
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'photos#index'
  resources :photos, only: [:index, :destroy] do
    get :for_voting, on: :collection
  end
  resources :votes, only: :create

  resources :users, only: :show do
    resources :photos, only: [:new, :create]
  end

  resources :chat_rooms, only: :create

  mount ActionCable.server => '/cable'
end
