Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :restaurants do
    resources :reviews, except: [:index, :show]
  end

  resources :users, only: [:show, :destroy, :index]

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
      resources :votes, only: [:create]
    end
  end

  namespace :admin do
    root 'admins#index'
  end

end
