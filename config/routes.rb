Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  resources :restaurants, only: [:index, :index] do
    resources :reviews, except: [:index, :show]
  end

  namespace :admin do
    resources :restaurants, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
    end
  end

end
