Rails.application.routes.draw do
  resources :purchases
  resources :episodes
  resources :seasons
  resources :movies
  resources :contents do
    resources :purchases, only: :create
  end
  resources :users do
    resources :library, only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
