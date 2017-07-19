Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :restaurants do
    resources :reviews, except: [:index, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
    end
  end

end
