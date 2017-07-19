Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :restaurants, only: [:index, :index] do
    resources :reviews, except: [:index, :show]
  end

  namespace :admin do
    resources :restaurants, only: [:new, :create, :edit, :update, :destroy]
  end

end
