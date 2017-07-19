Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :restaurants do
    resources :reviews, exceptt: [:index, :show]
  end

end
