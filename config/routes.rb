Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :restaurants do
    resources :reviews, expect: [:index, :show]
  end

end
